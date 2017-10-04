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
        translate([0,0,-12]) cube([15,15,20],true);
    }
}
module keyblockout() {
    translate([0,0,-2.2]) cherry_mx_keyhole();
}

module rotateat(a,v){
    translate(v) { rotate(a) translate(-v) children(); }
}

function lin(s, e, pct) = s + pct * (e - s);

sep = 19;
finger_lengths = [110-15,110-0,110-12,110-32];
//key_angles = [30, 15, 0, -45];
module hand() {
    for(row = [0:3], findex=[0:3]) {
        extend = lin(.5, 1.0, pow(row/3,.8)); // 0 to 1
        rotate([0, lin(20, 60, pow(row/3,1.2)), 0])
        translate([-finger_lengths[findex]*extend, findex*sep, 0])
            rotate([0, lin(-60,30,extend), 0]) children(0);
    }
}


difference(){
    union(){
        *translate([-60,30,45]) rotate([0,0,-30]) cube([80,100,120], true);
        translate([-75, 38-19/2, -40]) sphere(38, true);
        hand() translate([0,0,-15.375]) cube([19,19,6], true);
    }
    
    color("red") translate([-10, sep*4/2-19/2, 70]) cube([80,sep*4,120], true);
    hand() keyblockout();
    hand() color("red") translate([25,0,0]) cube([50,20,10], true);
}