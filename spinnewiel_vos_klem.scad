/*

 small part for a VO&S Spinnewiel:
 it's an eyelet to slide along the flight in
 order to collect the spun yarn on the bobbin

 You probably want to balance the flight with a few
 M7 washers and keep them in their place with 2 eyelets

 the 2 modules, outline() and punchout()
 describe the outline of the part and the holes
 to be punched out.

 Punchout is then subtracted from outline and the result
 is given thickness.
*/

$fn=90;

// flight is 6.5mm with a .5mm flat edge ground
// on one side. It keeps the eyelet straight
vlucht_dia=6.5;
vlucht_vlak=.5;

hoogte=6;

// bus schuift over vlucht
bus_dikte=6;
bus_id=vlucht_dia;
bus_od=bus_id+bus_dikte;

// create the eyelet: lay down the outline, punch a few holes
// and extrude it a bit
linear_extrude(height=hoogte, center=false, convexity=10) {
    difference() {
        outline();
        punchout();
    }
}

module punchout() {
    // flight: vlucht
    intersection() {
        circle(d=vlucht_dia);
        // the flight has a flat side to register
        translate([vlucht_vlak,0])
            square(
                [vlucht_dia-vlucht_vlak,vlucht_dia],
                center=true);
    }
}

module outline() {
    circle(d=bus_od);
}
