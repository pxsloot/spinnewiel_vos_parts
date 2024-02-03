// bus voor de as van een VO&S spinnewiel aandrijving
// buiten diameter 19.5
// binnen diameter 6 == vlucht arm diameter
// hoogte 11

$fn = 90;

difference() {
  union() {
    cylinder(h=11,d=19.5);
    translate([0,0,10.5])
      cylinder(h=2,d=22);
  };
  cylinder(h=20,d=6);
}