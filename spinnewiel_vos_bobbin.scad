$fn = 90;

// VO&S bobbin recreated from measurements

axle_length = 127.5;
axle_diameter = 19;
axle_min_width = 13;
axle_hole = 7;

bobbin_side_r=90;

pulley_width = 10;
pulley_diameter = 50;
pulley_r = pulley_diameter/2;

small_end = 6.5;
big_end = small_end + pulley_width;


include <spinnewiel_vos_bobbin_parts.scad>;

translate([70,0,small_end/2]) bobbin_end();
translate([0,70,0]) bobbin_big_end();
translate([0,0,axle_length/2]) bobbin_axle();
