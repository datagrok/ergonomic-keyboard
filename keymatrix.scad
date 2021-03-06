use <cherry_mx_keyhole.scad>

sep = 19;
finger_lengths = [110-15,110-0,110-12,110-32];
//key_angles = [30, 15, 0, -45];


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
        translate([0,0,-12]) cube([19,19,20],true);
    }
}
module keyblockout() {
    translate([0,0,-2.2]) {
        cherry_mx_keyhole();
        translate([20/2,0,16/2-10.15]) cube([20,sep,16],true);
    }
}

module rotateat(a,v){
    translate(v) { rotate(a) translate(-v) children(); }
}

function lin(s, e, pct) = s + pct * (e - s);

module key(row, findex) {
    extend = lin(.5, 1, pow(row/3,.8));
        rotate([0, lin(30, 70,
            row/3
            * pow(78/finger_lengths[findex], 0)
            //pow((row+1)/4,0))*pow(78/finger_lengths[findex],0)
        ), 0])
            translate([-finger_lengths[findex]*extend, findex*sep, 0])
                rotate([0, lin(-60,30,extend), 0])
                    children(0);
}
module hand() {
    for(row = [0:3], findex=[0:3])
        key(row, findex) children(0);
}
module span() {
    for(row = [0:3], findex=[0:3]) {
        if (row < 3) hull() {
            key(row, findex) children(0);
            key(row+1, findex) children(1);
        }
        if (findex < 3) hull() {
            key(row, findex) children(0);
            key(row, findex+1) children(0);
        }
    }
}
difference(){ // carve off everything below 0z
difference(){ // nothing should override keycap clearance
    union(){
        // plates for each socket
        translate([50,0,85])
        rotate([-30,0,0])
        rotate([0,-90,0])
        hand() translate([-sep/2,-sep/2,-18]) cube([sep,sep,6]);
        
        // joiners between the plates
        translate([50,0,85])
        rotate([-30,0,0])
        rotate([0,-90,0])
        span() {
            translate([-sep/2+3,0,-15]) cube([6,sep,6], true);
            translate([0,0,-15]) cube([sep,sep,6], true);
        }
        
        /* 
        // post
        translate([50,0,85])
        rotate([-30,0,0])
        rotate([0,-90,0])
        translate([-99,31,104]) rotate([90,30,60]) cylinder(60,4,4);
        // plate
        translate([50,0,85])
        rotate([-30,0,0])
        rotate([0,-90,0])
        translate([-73,45,44]) rotate([90,30,60]) cylinder(5,30,30);
        */
        // big box
        hull() {

        
        translate([0,-25,14]) 
            rotate([-45,0,0]) cube([100,50,7], true);
        translate([0,23.65,0]) 
            rotate([60,0,0]) cube([100,37,7], true);
        }
        
        

            
    }
    //translate([14,0,-8]) rotate([0,-55,0]) cube([10,19.5,20], true);
    translate([50,0,85])
    rotate([-30,0,0])
    rotate([0,-90,0])
    hand() keyblockout();
}
translate([-50,0,-15]) cube([250,250,30], true);
}