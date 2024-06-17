union() {
    square(size=[40, 40]);
    square(size=[10, 10], center=true);
    translate(v=[40, 0, 0])
    square(size=[14, 14], center=true);
    translate(v=[0, 40, 0])
    circle(r=9);
    translate(v=[40, 40, 0])
    circle(r=11);
}