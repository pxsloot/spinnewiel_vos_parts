$fn = 90;

// VO&S treadle plank fasteners
// using the original screwholes and screws

tube_radius = 8;
screw_head_diameter = 6;
screw_head_radius = screw_head_diameter/2;
screw_head_height = 2;
screw_body_diameter = 4;
screw_body_radius = screw_body_diameter/2;
screw_body_length = 21;
screw_body_clearance = 11;

screw_distance = 18;

h_clearance = 2;
v_clearance = .2;


module outer_hull() {
    hull_height = screw_body_clearance+screw_head_height+v_clearance;
    hull() {
        translate([screw_distance/2,0,0])
            cylinder(h=(hull_height), r=(screw_head_radius+h_clearance));

        translate([-screw_distance/2,0,0])
            cylinder(h=(hull_height), r=(screw_head_radius+h_clearance));
    }
}

// could've put it in a module. meh
// just build the thing
difference() {
    outer_hull();
    // hole for screwhead to sit in
    translate([screw_distance/2,0,(screw_body_clearance)])
        cylinder(h=100, r=(screw_head_radius+h_clearance/2));
    // hole for other screwhead to sit in
    translate([-screw_distance/2,0,(screw_body_clearance)])
        cylinder(h=100, r=(screw_head_radius+h_clearance/2));
    // through hole for the screw
    translate([screw_distance/2,0,0])
        cylinder(h=200,r=screw_body_radius, center=true);
    // through hole for the other screw
    translate([-screw_distance/2,0,0])
        cylinder(h=200,r=screw_body_radius, center=true);

    // make a place for the frame to fit. The original fasteners were angled,
    // so remove everything between angles 40 and -40 shaped like a frame tube
    // the form to remove is half a cube and half a cylinder (made a bit wider for
    // clearance)
    just_a_bit = .1;
    angle = 40;
    for ( i = [-angle:10:angle]) {
        translate([-v_clearance,0,(tube_radius/2-just_a_bit)])
            rotate([90,0,i])
                cube([tube_radius, tube_radius, 100], center=true);
    }
}
