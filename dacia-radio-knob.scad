knob_od=30;
knob_id=25 /* 32 */;
knob_oh=15;
knob_ih=12 /* 14 */;

eps=0.2;

pot_od=9;
pot_id=6.5;
pot_oh=7;
pot_ih=8;


difference() {
    cylinder(h=knob_oh,d=knob_od, $fn=30);
    translate([0,0,-eps])
        cylinder(h=knob_ih,d=knob_id, $fn=30);
}


translate([0,0,knob_ih-pot_oh]) union() { difference() {
    cylinder(h=pot_oh,d=pot_od, $fn=30);
    translate([0,0,-eps])
        cylinder(h=pot_ih,d=pot_id, $fn=30);
  }
  translate([-pot_id/2,-3.5,0])
    cube([pot_id,2,pot_ih]);
}