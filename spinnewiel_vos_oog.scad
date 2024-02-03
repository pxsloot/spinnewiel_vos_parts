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

hoogte=4;

// bus schuift over vlucht
bus_dikte=3;
bus_id=vlucht_dia;
bus_od=bus_id+bus_dikte;

// define eye for the yarn
// same as the the bus, but you can change it
ring_dikte=bus_dikte;
ring_id=15;
ring_od=ring_id+ring_dikte;

// center 2 center is used so much it's
// earned its own variable
c2c = (bus_od+ring_od)/2;

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
    // ring for the yarn
    translate([c2c,0])
        circle(d=ring_id);
}

module outline() {
    circle(d=bus_od);
    translate([c2c,0])
        circle(d=ring_od);

    // create a nice filler between the
    // 2 circles
    //
    // adapted from
    // https://unixwars.blogspot.com/2016/03/joining-two-circlescylinders-in.html
    r1 = bus_od/2;
    r2 = ring_od/2;

    alpha = asin((r2-r1)/(c2c));
    x1 = r1*sin(alpha);
    y1 = r1*cos(alpha);
    x2 = c2c-r2*sin(alpha);
    y2 = r2*cos(alpha);

    point0 = [-x1,-y1];
    point1 = [-x1,y1];
    point2 = [x2,y2];
    point3 = [x2,-y2];
    
    polygon(
        points=[
            point0,
            point1,
            point2,
            point3],
        paths=[[0,1,2,3]]);
}
