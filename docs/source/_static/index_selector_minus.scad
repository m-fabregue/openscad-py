union() {
    square(size=[40, 40]);
    difference() {
        circle(r=5);
        circle(r=4);
    }
    translate(v=[40, 0, 0])
    difference() {
        circle(r=7);
        circle(r=4);
    }
    translate(v=[0, 40, 0])
    difference() {
        circle(r=9);
        circle(r=4);
    }
    translate(v=[40, 40, 0])
    difference() {
        circle(r=11);
        circle(r=4);
    }
}