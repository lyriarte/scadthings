include<lib.scad>


hl1=20;
hl2=12;
hl3=30;
hw=8;
ht=1.5;


hd=8;
hl=20;
e=20;

difference(){ 
    translate([0,0,-hl2/4]) rotate([0,90,0])
        cylinder(h=hw, d=hl2*1.2, center=true);
    translate([0,0,-hl3/2])
        cube([hw*1.05,hl2-2*ht,hl3], center=true);
}
hang(hl1,hl2,hl3,hw,ht);
translate([0,-8,-hl3])
	hook(hd,hl,e);
