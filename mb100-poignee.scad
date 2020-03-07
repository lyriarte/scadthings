include<lib.scad>

baril_ext_d=20;
baril_ext_h=32;
baril_int_d=10.5;
baril_int_h=20;
baril_axis_d=4;
base_h=5;
pull_w=baril_ext_d*0.8;
pull_l=60;
pull_h=base_h*3;
drag_w=baril_ext_d*0.8;
drag_l=30;
drag_h=base_h;
drag_axis_d=4;


module poignee() {
    difference() {
        union() {
            cylinder(d=baril_ext_d, h=baril_ext_h);
            rotate([0,0,15]) union() {
                translate([-pull_w/2,0,0]) 
                    hull_box(pull_w,pull_l*1.015,pull_h,1.5,center=false);
                translate([-pull_w/2,pull_l,0]) 
					rotate([0,0,340])
                    hull_box(pull_w,pull_l * 0.3,pull_h,1.5,center=false);
				}
            rotate([0,0,260])
                translate([-drag_w/2,0,0]) 
                difference() {
					hull() {
						cube([drag_w,drag_l-drag_w/2,drag_h]);
						translate([drag_w/2,drag_l-drag_w/2,0])
							cylinder(d=drag_w, h=drag_h);
						translate([drag_w/2,0,0])
							cylinder(d=baril_int_d, h=baril_int_h*2/3);
					}
                    translate([drag_w/2,drag_l*0.8,-base_h*0.1]) 
                        cylinder(d=drag_axis_d, h=base_h*1.5);
                    translate([drag_w*0.2,drag_l*0.8,base_h]) 
                        cylinder(d=drag_w*1.67, h=base_h*2);
                } 
        }
        translate([0,0,-baril_ext_h*0.1])
            cylinder(d=baril_axis_d, h=baril_ext_h*1.2);
		translate([baril_ext_d*0.67,baril_ext_d*0.75,-1])
            cylinder(d=baril_ext_d*1.2, h=baril_ext_h+2);

    }
}

poignee();