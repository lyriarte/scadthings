epsilon=0.01;
t=4;
w=22;
l=35;
d=60;

difference() {
    union() {
        difference() {
            cylinder(d=d, h=w, center=true);
            cylinder(d=d-t, h=w+epsilon, center=true);
            }             
        intersection() {
            translate([0,0,(w+t)/2])
                cylinder(d=d, h=t+epsilon, center=true);
            translate([22,0,(w+t)/2])
                cube([20,l,t+epsilon], center=true);
        }
    }
    translate([-5.8,0,0])
        cube([d,d,w+epsilon*2], center=true);
}
