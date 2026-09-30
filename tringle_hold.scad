

t=2;
w=15;
lv=25;
lh=20;
d_ex=18;
d_in=13;
d_t1=8;
d_t2=4;
h_t=10;

cube([lh,w,t]);
translate([0,0,-lv])
difference() {
    cube([t,w,lv]);
    translate([1,w/2,lv-h_t-d_t1]) rotate([0,90,0])
    union() {
        hull() {
            cylinder(d=d_t2,h=t+2,center=true);
            translate([-h_t,0,0])
                cylinder(d=d_t2,h=t+2,center=true);
        }
        cylinder(d=d_t1,h=t+2,center=true);
    }
}
translate([lh+w/2,w,0]) rotate([90,0,0])
difference() {
  cylinder(d=d_ex,h=w);
    translate([0,0,-1])
    union() {
        cylinder(d=d_in,h=w+2);
        translate([-w/3,-w/8,0]) rotate([0,0,30])
            cube([w+t+2,w,w+2]);
    }
}

