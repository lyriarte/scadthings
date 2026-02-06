module hull_polygon(l, c=1) {
    hull() {
        for (i=[0:len(l)-1]) {
            translate([l[i][0],l[i][1],0])
                circle(r=c, $fn=30);
        }
    }
}

module hull_box(l,w,h,c, center=true)
{	
    translate([center ? 0 : l/2, center ? 0 : w/2, center ? 0 : h/2]) 
	hull() {
        translate([-l/2+c, -w/2+c, -h/2+c]) sphere(r=c, $fn=30);
        translate([ l/2-c, -w/2+c, -h/2+c]) sphere(r=c, $fn=30);
        translate([ l/2-c,  w/2-c, -h/2+c]) sphere(r=c, $fn=30);
        translate([-l/2+c,  w/2-c, -h/2+c]) sphere(r=c, $fn=30);
        translate([-l/2+c, -w/2+c,  h/2-c]) sphere(r=c, $fn=30);
        translate([ l/2-c, -w/2+c,  h/2-c]) sphere(r=c, $fn=30);
        translate([ l/2-c,  w/2-c,  h/2-c]) sphere(r=c, $fn=30);
        translate([-l/2+c,  w/2-c,  h/2-c]) sphere(r=c, $fn=30);
    }
}

module soap_box(l,w,h,t,nl,nw,r) {
	difference() {
        union() {
            hull_box(l,w,h,8, center=true);
            translate([-(l/2-r*1.5),-(w/2-r*1.5),-h+r*2/3])
                sphere(r=r*2/3, $fn=30);
            translate([ (l/2-r*1.5),-(w/2-r*1.5),-h+r*2/3])
                sphere(r=r*2/3, $fn=30);
            translate([-(l/2-r*1.5), (w/2-r*1.5),-h+r*2/3])
                sphere(r=r*2/3, $fn=30);
            translate([ (l/2-r*1.5), (w/2-r*1.5),-h+r*2/3])
                sphere(r=r*2/3, $fn=30);
        }
		translate([0,0,t]) 
            hull_box(l-t*2,w-t*2,h+t,8, center=true);
        translate([-l/2,-w/2,-h/2])
        for(i = [1:nl-1]) {
            for(j = [1:nw-1]) {
                translate([i*l/nl,j*w/nw,r*0.8])
                    sphere(r=r, $fn=30);
            }
        }
	}
}

module wedge(l,w,h1,h2) {
    hull() {
        translate([0,(l-h1)/2,0])
            rotate([0,90,0]) cylinder(d=h1, h=w, center=true);
        translate([0,-l*0.45,0])
            cube([w,l*0.1,h2], center=true);
    }
}

module hang(l1,l2,l3,w,t) {
    translate([0,l2/2-t/2,-l1/2]) rotate([90,0,0]) cube([w,l1,t], center=true);
    cube([w,l2,t], center=true);
    translate([0,-l2/2+t/2,-l3/2]) rotate([90,0,0]) cube([w,l3,t], center=true);
}

module hook(hd,hl,e,a=180,s=true) {
    cylinder(d=hd, h=hl, $fn=30);
    translate([0,-e,0])
	rotate([270,0,0]) rotate([0,90,0])
	    rotate_extrude(angle=a)
		translate([e, 0, 0]) 
		    circle(d=hd, $fn=30);
    if (s) {
	translate([0,0,hl])
	    sphere(d=hd);
	translate([0,-e*2,0])
	    sphere(d=hd);
    }
}

module hang_hook(hl1,hl2,hl3,hw,ht,ecart,hook_zs=1,hook_wf=1) {
	hang(hl1,hl2,hl3,hw,ht);
	translate([0,-hl2/2,-hl3*hook_zs])
		scale([1/hook_wf,1,hook_zs])
			hook(hw*hook_wf,hl3,ecart);
}

module rope_lock(l, h, di1, do1, di2, do2) {
	difference() {
		hull() {
			cylinder(d=do1, h=h);
			translate([l-(do1+do2)/2,0,0])
				cylinder(d=do2, h=h);
		}
	translate([0,0,-0.5])
		cylinder(d=di1, h=h+1);
	translate([l-(do1+do2)/2,0,-0.5])
		cylinder(d=di2, h=h+1);
	}
}

module rope_hook(l, h, di1, do1, di2, do2, a=30) {
	difference() {
		rope_lock(l, h, di1, do1, di2, do2);
		rotate([0,0,a]) translate([l/2,0,h/2])
			cube([l,di1/2,h+1], center=true);
	}
}

module hinge_unit(p,d,l,w,h) {
    difference() {
        intersection() {
            cube([l,w,h], center=true);
            union() {
                translate([p,0,0]) rotate([90,0,0]) cylinder(d=(l/2-p)*2,h=2*w, center=true);
                translate([-l/2,-w,-h/2]) cube([l/2+p,w*2,h]);
            }
        }
        translate([p,0,0]) rotate([90,0,0]) cylinder(d=d,h=2*w, center=true, $fn=30);
    }
}

module hinge_n(p,d,l,w,h,j=0.2, n=1, base_h=0) {
    translate([0,(l-base_h)/2,0])
        cube([(2*n-1)*(w+j),base_h,h], center=true);
	translate([-(n-1)*(w+j),0,0]) for (i = [0 : n-1] ) {
		translate([ 2*i*(w+j), 0, 0]) rotate([0,0,270]) hinge_unit(p,d,l,w,h);
	}
}

module hinge_join(p,d,l,w,h,j=0,base_h=0, n1=2, n2=3, ecart=0, angle=0, cutf=1.2)
{
    translate([0,-ecart,0]) rotate([-angle/2,0,0]) difference()
    {
      hinge_n(p,d,l,w,h,j,n1, base_h);
      translate([0,(ecart+l-p)/2,0]) rotate([0,90,0])
        cylinder(d=h*cutf, h=(n1+j)*2*w, center=true);
    }
    translate([0,ecart,0]) rotate([-angle/2,0,180])  difference()
    {
      hinge_n(p,d,l,w,h,j,n2, base_h);
      translate([0,(ecart+l-p)/2,0]) rotate([0,90,0])
        cylinder(d=h*cutf, h=(n2+j)*2*w, center=true);
    }
}

module hinge_lock(hd,hl,e,j=0.2, endlock=true) {
    cylinder(d=hd-j, h=hl, center=true, $fn=30);
    translate([-e,0,hl/2]) rotate([90,0,0]) rotate_extrude(angle=180, $fn=30)
       translate([e, 0, 0]) circle(d=hd-j);
    translate([-2*e,0,0]) rotate([0,0,0]) cylinder(d=hd-j, h=hl, center=true, $fn=30);
    translate([-e,0,-hl/2]) rotate([90,0,0]) rotate_extrude(angle=90, $fn=30)
       translate([-e, 0, 0]) circle(d=hd-j);
	if (endlock) {
		translate([-e/2,0,-hl/2-hd]) rotate([0,90,0]) cylinder(d=hd-j, h=hl/4, center=true, $fn=30);
	}
}

module grip(l, d, f=1.2, t=0.5, dg=0, dh=1, dfl=1, center=true) {
    difference() {
        hull() {
            cylinder(h=l, d=d*f, center=center, $fn=30);
            if (dg != 0) {
                translate([dg + (t>0 ? 1 : -1) * (center ? d/2 : 0), 0, 0])
#                    cylinder(h=l*dfl, d=dh, center=center);
            }
        }
        cylinder(h=l*1.1, d=d, center=center, $fn=30);
        translate([d*f*t, 0, 0])
            cube([d*f,d*f,l*1.1], center=center);
    }
}

module angle_hold(a,r,l,t,d, f=1.2, dt=0.67, fl=1, dg=0, dh=1, dfl=1) {
    difference() {
        rotate_extrude(angle=a)
            translate([r, 0, 0]) square([l,t], center=true);
        rotate([90,0,90-0.5])
            translate([0,0,r]) cylinder(h=l*f, d=d*f, center=true, $fn=30);
        rotate([90,0,90+a+0.5])
            translate([0,0,r]) cylinder(h=l*f, d=d*f, center=true, $fn=30);
    }
    rotate([90,0,90])
        translate([0,0,r*0.995]) grip(l=l*fl, d=d, f=f, t=-dt, dg=dg, dh=dh, dfl=dfl);
    rotate([90,0,90+a])
        translate([0,0,r*0.995]) grip(l=l*fl, d=d, f=f, t=dt, dg=-dg, dh=dh, dfl=dfl);
}

module tube_lock(hinge_p, hinge_d, hinge_l, hinge_w, hinge_h, grip_l, grip_d, n=1, flat=true, f_grip=1.2) {
    difference() {
        union() {
            grip(grip_l, grip_d, f_grip);
            translate([flat?-hinge_w/2:0,-(hinge_l+grip_d)/2,0]) 
                rotate([0, flat?0:90, 0])
                    hinge_n(hinge_p,hinge_d,hinge_l,hinge_w,hinge_h, n=n);
            translate([flat?-hinge_w/2:0,(hinge_l+grip_d)/2,0]) rotate([0,0,180])
                rotate([0, flat?0:90, 0])
                    hinge_n(hinge_p,hinge_d,hinge_l,hinge_w,hinge_h, n=n);
        }
        if(!flat) {
            translate([grip_d/2,0,0])
                cube([grip_d,grip_d*f_grip,grip_l], center=true);
        }
    }
}

module cylinder_groove_lock(d1,h1,d2,h2) {
    cylinder(d=d2,h=h2, $fn=30);
    translate([0,0,h2*0.95])
	cylinder(d=d1,h=h1, $fn=30);
}

module sphere_hold(d,e,j,d1,a1,d2,a2) {
    difference() {
        sphere(d=d+e);
        sphere(d=d+j);
        rotate([0,a1,0]) translate([d1,0,0])
#            cube([d+e+j,d+e+j,d+e+j], center=true);
        rotate([0,a2,0]) translate([d2,0,0])
#            cube([d+e+j,d+e+j,d+e+j], center=true);
    }
}

module sphere_magnet_hold(d,e,c,j,d1,a1,d2,a2) {
    difference() {
        sphere_hold(d,e,j,d1,a1,d2,a2);
        translate([-(d+c)/2,0,0])
#            cube([c+j,c+j,c+j], center=true);
    }
}

module sphere_hinge_hold(d,e,j,d1,a1,d2,a2,hp,hd,hl,hw,hh,hn=3,ah=0,av=0) {
	sphere_hold(d,e,j,d1,a1,d2,a2);
	rotate([0,ah,0]) 
		translate([-(d+hl)*0.49,0,0]) 
			rotate([0,av,-90])
				hinge_n(hp,hd,hl,hw,hh, n=hn, base_h=e*1.5);
}


module stepper_tool(d=6, h=10, j=0) {
	translate([0,0,-h]) difference() {
		cylinder(d=d, h=h, $fn=60);
		translate([0,0,h-9])
			intersection() {
				cylinder(d=5.5+j, h=10, $fn=30);
				translate([0, 0, (h+2)/2]) 
					cube([3+j, 10, 12], center=true);
			}
		translate([0, 0, h-3])
			rotate([90, 0, 90])
				cylinder(d=3, h=d*1.1, $fn=30, center=true);
	}
}

module stepper_tool_base(d=6, h=10, j=0, base_d=12, base_h=3) {
	stepper_tool(d, h, j);
	translate([0,0,base_h/2]) difference() {
		cylinder(d=base_d, h=base_h, center=true, $fn=60);
		cylinder(d=5.5+j, h=base_h+3, center=true, $fn=60);
		translate([0,0,1])
			cylinder(d=10+j, h=base_h-1, center=true, $fn=60);
	}
}

module wheel(d, h, n_hole, n_grip=0, groove_d=0) {
    difference() {
        union() {
            for(i = [0:n_grip]) {
                rotate([0, 0, i * 360 / n_grip])
                translate([d / 2, 0, 0])
        			cylinder(d=360/(3*n_grip), h=h, $fn=9, center=true);
            }
            cylinder(d=d, h=h, $fn=120, center=true);
        }
	    rotate_extrude(angle=360)
			translate([d/2, 0, 0]) 
#				circle(d=groove_d, $fn=4);
        for(i = [0:n_hole]) {
            rotate([0, 0, i*360/n_hole]) hull() {
                translate([d/6, 0, 0])
                cylinder(d=d/(n_hole+1), h=h*1.1, $fn=30, center=true);
                translate([d/2.2 - d/(n_hole+1), 0, 0])
                cylinder(d=d*2/(n_hole+1), h=h*1.1, $fn=30, center=true);
            }
        }
    }
}

module molette(d, h, d_grip, n_grip=3) {
	hull() {
		for(i = [0:n_grip]){
			rotate([0, 0, i * 360 / n_grip])
			translate([d_molette / 2, 0, 0])
				cylinder(d=d_grip, h=h, $fn=30);
		}
	}
}

module strap(l,w,h,e) {
    hull_box(l,w,h,0.5);
    translate([-l/2,0,e*(-1/3)])
    for(i = [0:e:l*0.95]) {
        translate([i,0,0])
            rotate([0,-25,0])
                cube([2.2,w,1], center=true);
    }
}

module curved_hollow_tube(curve_d, tube_d, factor, height, angle) {
  difference() {
    translate([0,0,height-curve_d/2]) rotate([90,angle/2-90,0]) 
        rotate_extrude(angle=angle,$fn=90)
            translate([curve_d/2,0,0])
                circle(d=tube_d*factor);
    translate([0,0,-curve_d/2]) rotate([90,angle/2-90,0]) 
        rotate_extrude(angle=angle,$fn=90)
            translate([curve_d/2,0,0])
                circle(d=tube_d);
  }  
}

module corner_hold(c, h, t, w, epsilon=0.02) {
    difference() {
        cube([c,c,h], center=true);
        translate([t,t,0])
            cube([c,c,h+t], center=true);
        translate([h,-(c-t)/2,h/2+t]) rotate([90,0,0])
            cylinder(r=h,h=t+epsilon, center=true, $fn=60);
        translate([-(c-t)/2,h,h/2+t]) rotate([0,90,0])
            cylinder(r=h,h=t+epsilon, center=true, $fn=60);
    }
    translate([-w/2,-(c+w+t)/2,-(h-t)/2])
        cube([c+w,t+w,t], center=true);
    translate([-(c+w+t)/2,-w/2,-(h-t)/2])
        cube([t+w,c+w,t], center=true);

    translate([-(c/2+w),-(c/2+w),-(h-t)/2])
        cylinder(r=t,h=t, center=true, $fn=30);
}

module pot_knob(d,h,gd,gh,gw,bd,bh,f,a,j) {
	difference() {
		hull() {
			cylinder(d=d, h=h, $fn=36);
			rotate([0,0,a]) polyhedron(
				points = [ 
					[d*f/2, 0, 0], [-d*f/3, d*f/5, 0], [-d*f/3,-d*f/5, 0],
					[d*f/2, 0, h], [-d*f/3, d*f/5, h], [-d*f/3,-d*f/5, h],
				], 
				faces = [ [0,1,2], [0,1,4,3], [1,2,5,4], [0,2,5,3], [3,4,5]]
			);
		}
		translate([0,0,-0.5])
			cylinder(d=bd+j, h=bh+1, $fn=36);
		translate([0,0,bh])
			difference() {
				cylinder(d=gd+j, h=gh, $fn=36);
				translate([-(gd+1)/2,-(gw-j)/2,-0.5])
					cube([gd+1, gw-j, gh+1]);
			}
	}
}

