use <cherry_mx_keyhole.scad>

module keyandsacap() {
    translate([0,0,-5.7]) {
        hull() {
            cube([18.4,18.4,.01], true);
            translate([0,0,11.73]) cube([18.4-5.7,18.4-5.7,.01], true);
        }
        translate([0,0,3.5]) cmxsw();
    }
}
module keyanddsacap() {
    translate([0,0,-5.7]) {
        hull() {
            cube([18.4,18.4,.01], true);
            translate([0,0,5.7]) cube([18.4-5.7,18.4-5.7,.01], true);
        }
        translate([0,0,3.5]) cmxsw();
    }
}
module keyblockout() {
    translate([0,0,-2.2]) cherry_mx_keyhole();
}

module rotateat(a,v){
    translate(v) { rotate(a) translate(-v) children(); }
}

sep = 19.5;
finger_lengths = [15,0,12,32];
key_angles = [30, 15, 0, -45];
module finger() {
    translate([sep*-1,0,0]) rotateat(a=[0,30,0], v=[sep/2,0,-4]) {
        children(0);
        translate([sep*-1,0,6]) rotateat(a=[0,0,0], v=[sep/2,0,-4])
            children(1);
    }        
    translate([sep*0,0,0]) children(2);
    translate([sep*1,0,0]) rotateat(a=[0,-60,0], v=[-sep/2,0,-4]) children(3);
}

*color("red") {
translate([-37,0,6]) rotate([0,30,0]) cube([19,19,6], true);
translate([-21,0,-3]) rotate([0,30,0]) cube([19,19,6], true);
}

difference(){
union() {
finger() {
        translate([0,0,-15.375]) cube([19,19,6], true);
        translate([0,0,-15.375]) cube([19,19,6], true);
        translate([0,0,-15.375]) cube([19,19,6], true);
        translate([0,0,-15.375]) cube([19,19,6], true);
}
translate([-30.6,0,-1]) cube([6,19,11], true);
translate([-12.5,0,-14.7]) rotate([0,15,0]) cube([12,19,8], true);
translate([15,0,-13.7]) rotate([0,-45,0]) cube([16,19,6], true);
translate([15,0,-13]) rotate([0,45,0]) cube([10,19,50], true);
}
finger() {
    keyblockout();
    keyblockout();
    keyblockout();
    keyblockout();
    }
translate([0,0,-43]) cube([50,19,50], true);
}


*for (c=[0:3])
    translate([finger_lengths[c],c*sep,0])
        finger();
