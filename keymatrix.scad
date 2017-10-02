use <switch_mx.scad>

module keyandsacap() {
    translate([0,0,-5.7]) {
        hull() {
            cube([18.4,18.4,.01], true);
            translate([0,0,11.73]) cube([18.4-5.7,18.4-5.7,.01], true);
        }
        translate([0,0,3.5]) cherry_mx_switch();
    }
}
module keyanddsacap() {
    translate([0,0,-5.7]) {
        hull() {
            cube([18.4,18.4,.01], true);
            translate([0,0,5.7]) cube([18.4-5.7,18.4-5.7,.01], true);
        }
        translate([0,0,3.5]) cherry_mx_switch();
    }
}
module keyblockout() {
    translate([0,0,-2.2]) cherry_mx_keyhole();
}

q=18;

difference() {
for (r = [0:3], c=[[0,15],[1,0],[2,12],[3,32]])
    translate([c[1],0,0]) rotate([0, r*45-67.5-22.5]) translate([0,c[0]*19,-q])
        translate([0,0,-13.1]) cube([28.25,19,6],true);

for (r = [0:3], c=[[0,15],[1,0],[2,12],[3,32]])
    translate([c[1],0,0]) rotate([0, r*45-67.5-22.5]) translate([0,c[0]*19,-q]) keyblockout();
}
//translate([68,-19,-36]) rotate([90,0,0]) keyanddsacap();
