/*
 * A blockout used for creating Cherry MX keyswitch receptacles in solid objects.
 * Dimensions referenced and approximate those used by gcb's switch_mx.scad.
 * https://bitbucket.org/gcb/3dump/src/8c0555016ecb091764b122b7b80777f2fc6ce9c2/keyboards/cherry/switch_mx.scad?at=default&fileviewer=file-view-default
 */

module cherry_mx_keyhole() {
    difference() {
        union() {
        //translate([0,0,-9.3-5.5/2]) cube([17,17,5.5],true);
        translate([0,0,-20/2]) cube([14,14,20], true);
        translate([0,0,-12]) cube([4,15,1.13], true);
        translate([0,0,-9.3+1-0.82/2]) cube([15.75,15.75,1.82], true);
        }
    translate([7,0,-12]) rotate([0,45,0]) cube([2,3,2], true);
    translate([-7,0,-12]) rotate([0,45,0]) cube([2,3,2], true);
    }
}

