union() {
    square(size=[40, 40]);
    intersection() {
        circle(r=5);
        square(size=[9.0, 9.0], center=true);
    }
    translate(v=[40, 0, 0])
    intersection() {
        circle(r=7);
        square(size=[12.6, 12.6], center=true);
    }
    translate(v=[0, 40, 0])
    intersection() {
        circle(r=9);
        square(size=[16.2, 16.2], center=true);
    }
    translate(v=[40, 40, 0])
    intersection() {
        circle(r=11);
        square(size=[19.8, 19.8], center=true);
    }
}