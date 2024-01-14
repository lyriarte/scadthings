include<lib.scad>


hole_w=33;
hole_h=4;

mask_border=2;
mask_w=39;
mask_d=6;
mask_h=14;

pin_w=4.5;
pin_h=4;
pin_d=12;
pin_gap=1.5;

difference() {
scale([1, mask_d/mask_h, 1])
rotate([0,90,0])
    cylinder(h=mask_w, r=mask_h, center=true, $fn=60);
translate([0, mask_d*1.05, 0])
    cube([mask_w*1.05, mask_d*2.1, mask_h*2.1], center=true);
translate([0, 0, -mask_h*1.05])
    cube([mask_w*1.05, mask_d*2.1, mask_h*2.1], center=true);
scale([0.85, 0.85*mask_d/mask_h, 0.85])
rotate([0,90,0])
    cylinder(h=mask_w, r=mask_h, center=true, $fn=60);
}


module pin_clip(w,d,h,g,c) {
    difference() {
        union() {
            cube([w, d, h]);
                translate([0,d,h/2])
                rotate([0,90,0])
                    cylinder(d=h+c, h=w, $fn=30);
        }
        translate([-w*0.025,d/2,(h-g)/2])
            cube([w*1.05, d, g]);
    }
}

translate([ -pin_w/2+7, -mask_d*0.95, 1])
    pin_clip(pin_w, pin_d, pin_h, pin_gap, 1);

translate([ -pin_w/2-7, -mask_d*0.95, 1])
    pin_clip(pin_w, pin_d, pin_h, pin_gap, 1);