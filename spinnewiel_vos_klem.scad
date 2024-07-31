/*

 small part for a VO&S Spinnewiel:
 it's an bushing to slide along the flight in
 order to fix washers in place. Washers are needed to balance
 the flight.

 the 2 modules, outline() and punchout()
 describe the outline of the part and the holes
 to be punched out.

 Punchout is then subtracted from outline and the result
 is given thickness.
*/

$fn=90;

// flight is 6.5mm with a .5mm flat edge ground
// on one side. It keeps the eyelet straight
flight_dia=6.5;
flight_vlak=.5;

thickness=6;

// bus goes over flight
bus_thickness=6;
bus_id=flight_dia;
bus_od=bus_id+bus_thickness;

// create the eyelet: lay down the outline, punch a few holes
// and extrude it a bit
linear_extrude(height=thickness, center=false, convexity=10) {
    difference() {
        outline();
        punchout();
    }
}

module punchout() {
    intersection() {
        circle(d=flight_dia);
        // the flight has a flat side to register
        translate([flight_vlak,0])
            square(
                [flight_dia-flight_vlak,flight_dia],
                center=true);
    }
}

module outline() {
    circle(d=bus_od);
}
