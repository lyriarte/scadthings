include<lib.scad>

module phone_hole(l,w,h,j=0.5,c=3)
{
	hull_box(l+2*j, w+2*j, h+2*j, c);
}

module phone_case_display_hole(l,w,h,r) {
    cube([l-2*r, w-2*r, h*2], center=true);
}

module phone_case_slide_hole(l,w,h,j=0.5,c=3) {
    translate([-l/2, -0, -0]) phone_hole(l,w,h,j,c);
}


module phone_case(l,w,h,m,r,j=0.5,c=3) {
    difference() {
        hull_box(l+2*(j+m), w+2*(j+m), h+2*(j+m), c);
        phone_case_display_hole(l,w,h,r);
        phone_case_slide_hole(l,w,h,j,c);
        phone_hole(l,w,h,j,c);
    }
}

