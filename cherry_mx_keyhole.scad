/*
 * A blockout used for creating Cherry MX keyswitch receptacles in solid objects.
 * Dimensions referenced and approximate those used by gcb's switch_mx.scad:
 * https://bitbucket.org/gcb/3dump/src/8c0555016ecb091764b122b7b80777f2fc6ce9c2/keyboards/cherry/switch_mx.scad
 */

module copymirror(v) {
    children();
    mirror(v) children();
}
module cmxsw() {}
module cherry_mx_keyhole() {
    difference() {
        union() {
            // body
            translate([0,0,-9.3-5.5/2]) cube([14,14,5.5],true);
            // cap clearance
            translate([0,0,1]) cube([18.4,18.4,20], true);
            // pin clearance
            translate([0,0,-14.5]) union() {
                translate([0,0,-6/2]) cube([14,14,6], true);
                hull(){
                translate([0,0,-6/2-1/2]) cube([14,14,1], true);    
                translate([0,0,-6/2-1/2-15/2-4.4]) cube([18.4,18.4,15], true);
                }
            }
            // clips
            copymirror([0,-1,0]) translate([0,7,-12]) intersection() {
                rotate([45,0,0]) cube([6,1.1,1.1], true);
                rotate([-90,0,0]) cylinder(3,3,0,$fn=4);
            }
            // pins    
            translate([0,0,-9.25]) cube([15.75,15.75,1.82], true);
        }
        // recesses
        copymirror([-1,0,0]) translate([7,0,-12]) rotate([45,0,0]) rotate([0,-90,0]) cylinder(1,2,0,$fn=4);
    }
}
