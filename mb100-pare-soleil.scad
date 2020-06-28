tube_d=10;
tube_h=15;
tube_d1=4;
tube_h1=5;
tube_d2=7;

difference() {
    cylinder(d=tube_d, h=tube_h, $fn=30);
    translate([0,0,-1])
        cylinder(d=tube_d1, h=tube_h+2, $fn=15);
    translate([0,0,tube_h1])
        cylinder(d=tube_d2, h=tube_h, $fn=15);
    
}
