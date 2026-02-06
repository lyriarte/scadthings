include<lib.scad>

jeu=0.4;

grp_d=6;
grp_h=6;
grv_w=1;
bas_d=8;
bas_h=6;
knb_d=12;
knb_h=18;

pnt_f=3/2;
pnt_a=90;


rotate([180,0,0])
	pot_knob(knb_d,knb_h,grp_d,grp_h,grv_w,bas_d,bas_h,pnt_f,pnt_a,jeu);

