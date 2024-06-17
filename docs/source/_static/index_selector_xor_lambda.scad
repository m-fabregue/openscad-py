union() {
            square(size=[40, 40]);
            union() {
                difference() {
                    circle(r=5);
                    square(size=[8, 8], center=true);
                }
                difference() {
                    square(size=[8, 8], center=true);
                    circle(r=5);
                }
            }
            translate(v=[40, 0, 0])
            union() {
                difference() {
                    circle(r=7);
                    square(size=[12, 12], center=true);
                }
                difference() {
                    square(size=[12, 12], center=true);
                    circle(r=7);
                }
            }
            translate(v=[0, 40, 0])
            union() {
                difference() {
                    circle(r=9);
                    square(size=[16, 16], center=true);
                }
                difference() {
                    square(size=[16, 16], center=true);
                    circle(r=9);
                }
            }
            translate(v=[40, 40, 0])
            union() {
                difference() {
                    circle(r=11);
                    square(size=[20, 20], center=true);
                }
                difference() {
                    square(size=[20, 20], center=true);
                    circle(r=11);
                }
            }
        }