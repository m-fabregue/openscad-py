union() {
        square(size=[40, 40]);
        union() {
            circle(r=5);
            cylinder(r=12);
        }
        translate(v=[40, 0, 0])
        union() {
            circle(r=7);
            circle(r=12);
        }
        translate(v=[0, 40, 0])
        union() {
            circle(r=9);
            circle(r=12);
        }
        translate(v=[40, 40, 0])
        union() {
            circle(r=11);
            circle(r=12);
        }
    }