include<lib.scad>

lampe_boule_d=40;

jeu=0.2;
epaisseur=3;

portee=2.5;
vis=4;
hinge_l=18;
hinge_w=3;
hinge_h=12;

sphere_hinge_hold(
        lampe_boule_d, epaisseur, jeu,
        30, 15, 25, -45,
        portee,vis,hinge_l,hinge_w,hinge_h,
        hn=3,ah=-12,av=0
    );

