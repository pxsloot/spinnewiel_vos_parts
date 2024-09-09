//$fn = 90;
//
//// VO&S bobbin recreated from measurements
//
//axle_length = 127.5;
//axle_diameter = 19;
//axle_min_width = 13;
//axle_hole = 7;
//
//bobbin_side_r=90;
//
//pulley_width = 10;
//pulley_diameter = 50;
//pulley_r = pulley_diameter/2;
//
//small_end = 6.5;
//big_end = small_end + pulley_width;

module bobbin_axle() {
    // radius from chord and max height
    chord = axle_length - ( big_end + small_end );
    height = axle_diameter - axle_min_width;

    r = 2*(4*(height*height) + (chord*chord))/(8 * height);

    rotate_extrude()
        difference() {
            translate([axle_hole/2,-axle_length/2,0])
                square([(axle_diameter - axle_hole)/2, axle_length]);
            translate([r + axle_min_width/2,(big_end - small_end)/2,0])
                circle(r);
        }
//    // TODO: notch
//    cube([0,0,0], center=true);
}

module bobbin_end() {
    top_r = small_end/2;
    rotate_extrude()
        hull() {
            translate([bobbin_side_r/2-top_r,0,0])
                circle(top_r);
            translate([(small_end+axle_diameter)/2,0,0])
                square(small_end, center=true);
        }
}

module bobbin_pulley() {
    mask = axle_diameter;
    some_factor = 6;
    rotate_extrude()
        difference() {
            translate([pulley_r/2,0,0])
                square([pulley_r, pulley_width], center=true);
            square(mask, center=true);
            translate([pulley_width+pulley_r/2 + some_factor, 0,0])
                rotate([0,0,45])
                    square(pulley_width, center=true);
        }
}

module bobbin_big_end() {
    translate([0,0,small_end+pulley_width/2-.5]) bobbin_pulley();
    translate([0,0,small_end/2]) bobbin_end();
}

//translate([70,0,small_end/2]) bobbin_end();
//translate([0,70,0]) bobbin_big_end();
//translate([0,0,axle_length/2]) bobbin_axle();