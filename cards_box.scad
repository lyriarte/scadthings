include<lib.scad>

brique_l=223;
brique_w=108;
brique_h=54;
brique_dl=25;
brique_dw=25;

card_w=55;
card_h=85;

box_l=card_w+5;
box_w=20;
box_h=card_h/2;

hl1=10;
hl2=brique_dw+10;
hl3=15;
hw=10;
ht=1.5;

nl=5;
nw=4;
r=5;

hang(hl1,hl2,hl3,hw,ht);

translate([0,(box_w+hl2)/2-ht,-box_h/3])
difference(){
hull_box(box_l,box_w,box_h,4);
translate([0,0,2*ht])
cube([box_l-2*ht,box_w-2*ht,box_h], center=true);
    
for(j = [1:nw-1]) {
    for(i = [1:nl-(1+((j+1)%2))]) {
        translate([-(box_w/nw)*((j+1)%2)+box_l/2-i*box_l/nl,box_w/2,box_h/2-j*box_h/nw])
        rotate([90,0,0])
#            cylinder(r=r, h=10, center=true, $fn=30);
    }
}
for(k = [1:nw-1]) {
translate([0,0,box_h/2-k*box_h/nw])
    rotate([0,90,0])
#            cylinder(r=r*0.9, h=box_l*2, center=true, $fn=30);
}
}
