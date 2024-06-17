union() {
    difference() {
        circle(r=10);
        square(size=[20, 20]);
    }
    difference() {
        square(size=[20, 20]);
        circle(r=10);
    }
}