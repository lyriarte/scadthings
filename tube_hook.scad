include<lib.scad>



tubed=24;

hd=5;
hl=30;
e=8;

difference() {
    union() {
        translate([0,0,tubed/6]) rotate([0,90,0]) 
            cylinder(h=hd, d=tubed*1.2, center=true);
        translate([0,-tubed/2,-hl*0.8]) rotate([0,0,180]) 
            hook(hd,hl,e);
    }
    rotate([0,90,0]) 
        cylinder(h=hd*1.05, d=tubed, center=true);
}
