union() {
    square(size=[40, 40]);
    intersection() {
        circle(r=5);
        square(size=[12, 12], center=true);
    }    
    translate(v=[40, 0, 0])
    intersection() {
        circle(r=7);
        square(size=[12, 12], center=true);
    }
    translate(v=[0, 40, 0])
    intersection() {
        circle(r=9);
        square(size=[12, 12], center=true);
    }
    translate(v=[40, 40, 0])
    intersection() {
        circle(r=11);
        square(size=[12, 12], center=true);
    }
}