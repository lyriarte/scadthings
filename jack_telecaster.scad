include <lib.scad>

l=38;
w=29;
h=1.5;
d_vis=3;
dl_vis=4;
dw_vis=4;
d_jack=10;


difference() {
    hull_box(l,w,h,0.3, center=true);
    cylinder(d=d_jack, h=h*2, center=true, $fn=30);
    translate([ l/2-dl_vis, w/2-dw_vis, 0])
        cylinder(d=d_vis, h=h*2, center=true, $fn=30);
    translate([-l/2+dl_vis, w/2-dw_vis, 0])
        cylinder(d=d_vis, h=h*2, center=true, $fn=30);
    translate([-l/2+dl_vis,-w/2+dw_vis, 0])
        cylinder(d=d_vis, h=h*2, center=true, $fn=30);
    translate([ l/2-dl_vis,-w/2+dw_vis, 0])
        cylinder(d=d_vis, h=h*2, center=true, $fn=30);
}