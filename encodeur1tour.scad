difference() {
    linear_extrude(height=1) {
        difference() {
            circle(d=30,$fn=100);
            intersection() {
                circle(d=5.2,$fn=100);
                translate([-3,-1.6]) square([6,3.2]);
            }
                
            translate([-1,8]) square([2,5]);
        }
    }
    
    //translate([0,0,0.2]) cylinder(d=13,h=2,$fn=100);
}