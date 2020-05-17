include<lib.scad>


hl1=20;
hl2=12;
hl3=30;
hw=8;
ht=1.5;


hd=8;
hl=20;
e=20;

hang(hl1,hl2,hl3,hw,ht);
translate([0,-8,-hl3])
	hook(hd,hl,e);

