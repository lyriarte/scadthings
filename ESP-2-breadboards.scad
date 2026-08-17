include<lib.scad>

in_l=25;
in_w=60;
in_h=95;

box_t=2;

box_l=in_l+box_t;
box_w=in_w+box_t;
box_h=in_h+box_t;

nll=5;
nwl=7;
rl=5;

nlw=2;
nww=6;
rw=7;

nlh=2;
nwh=4;
rh=7;

c=5;

soap_closed_box(box_l, box_w, box_h, in_l, in_w, in_h, c, 2,
    nll,nwl,rl, nlw,nww,rw, nlh,nwh,rh);