include<lib.scad>

soap_l=87;
soap_w=55;
soap_h=27;

jeu=5;
in_l=soap_l+jeu;
in_w=soap_w+jeu;
in_h=soap_h+jeu;

box_t=3;
box_l=in_l+box_t;
box_w=in_w+box_t;
box_h=in_h+box_t;

nll=4;
nwl=3;
rl=5.5;

nlw=7;
nww=3;
rw=5;

nlh=7;
nwh=4;
rh=6.5;

c=3;

soap_closed_box(box_l, box_w, box_h, in_l, in_w, in_h, c, jeu,
    nll,nwl,rl, nlw,nww,rw, nlh,nwh,rh);