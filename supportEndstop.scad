linear_extrude(height=2) {
    rotate(-30) union() {
        difference() {
            union() {
                circle(d=36,$fn=100);
                translate([-11,-17.5-2]) square([22,10]);
            }
            circle(d=28.5,$fn=100);
            translate([-8.75,-17.5]) square([17.5,10]);
        }
        
    }
    
    translate([sin(30)*8-5,15]) square([10,9-4.2]);
    translate([sin(30)*8-1.3,24-4.2]) square([2.6,5]);
}