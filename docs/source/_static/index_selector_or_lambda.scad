union() {
    square(size=[40, 40]);
    union() {
        circle(r=5);
        cylinder(h=5, r=4);
    }
    translate(v=[40, 0, 0])
    union() {
        circle(r=7);
        cylinder(h=5, r=6);
    }
    translate(v=[0, 40, 0])
    union() {
        circle(r=9);
        cylinder(h=5, r=8);
    }
    translate(v=[40, 40, 0])
    union() {
        circle(r=11);
        cylinder(h=5, r=10);
    }
}