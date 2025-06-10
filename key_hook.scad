include<lib.scad>

brique_l=223;
brique_w=108;
brique_h=54;
brique_dl=25;
brique_dw=25;

hl1=10;
hl2=brique_dw+10;
hl3=15;
hw=8;
ht=1.5;


hook_wf=1/2;
hook_l=hl3;
ecart=10;
hook_zs=1.5;

translate([ hl3*2, hl2,0]) rotate([0,90,0])
	hang_hook(hl1,hl2,hl3,hw,ht,ecart,hook_zs,hook_wf);
translate([-hl3*2, hl2,0]) rotate([0,90,0])
	hang_hook(hl1,hl2,hl3,hw,ht,ecart,hook_zs,hook_wf);
translate([ hl3*2,-hl2,0]) rotate([0,90,0])
	hang_hook(hl1,hl2,hl3,hw,ht,ecart,hook_zs,hook_wf);
translate([-hl3*2,-hl2,0]) rotate([0,90,0])
	hang_hook(hl1,hl2,hl3,hw,ht,ecart,hook_zs,hook_wf);
