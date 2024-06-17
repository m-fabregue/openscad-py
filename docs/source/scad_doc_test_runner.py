import doctest
import subprocess
import tempfile
import os
import re

def run_doctests():
    for root, dirs, files in os.walk("."):
        for file in files:
            if file.endswith(".rst"):
                filename = os.path.join(root, file)
                with open(filename, "r") as f:
                    rst_content = f.read()

                blocks = extract_doctest_blocks(rst_content)
                for block in blocks:
                    print(block)
                    with tempfile.NamedTemporaryFile(mode='w', suffix=".scad", delete=False) as scad_file:
                        scad_file.write("\n".join(block))
                        scad_file.flush()
                        scad_file_path = scad_file.name

                    result = subprocess.run(["openscad", "--projection=ortho", "-o", "toto.png", scad_file_path], capture_output=True)
                    if result.returncode != 0:
                        print(f"Error in {filename}")
                        print("\n".join(block))
                        print(result.stderr.decode("utf-8"))
                        exit(1)

                    os.unlink(scad_file_path)
                    
def extract_doctest_blocks(rst_content):
    # Utilisation de regex pour extraire les blocs doctest complets
    pattern = re.compile(r'^\s*..\s+doctest::\s*(.*?)\s*^\s*(?=^\S|\Z)', re.DOTALL | re.MULTILINE)
    blocks = pattern.findall(rst_content)
    blocks = [b.split("\n") for b in blocks]
    blocks = [[l for l in b if not l.lstrip().startswith(">>> ")] for b in blocks if len(b) > 0]
    blocks = [b[1:] for b in blocks if len(b) > 0 and b[0] == ":options: +SCAD"]
    return blocks


run_doctests()
