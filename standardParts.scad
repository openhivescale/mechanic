include <parameters.scad>;

/////////////////////////////////////////////////
/////     Pièces du commerce          /////
/////////////////////////////////////////////////

module mountingLug() {
	difference()
	{
		hull()
		{
			cylinder(r=7/2, h=0.5, $fn=40);
			translate([0,-7/2,0]) cube([7,7,0.5]);
		}
		translate([0,0,-1]) cylinder(r=4.2/2, h=2, $fn=40);
	}
}


module stepper28BYJ() {
difference()
    {
        union()
        {
            //Body
            color("SILVER") cylinder(r=28/2, h=19, $fn=60);
            //Base of motor shaft
            color("SILVER") translate([0,8,19]) cylinder(r=9/2, h=1.5, $fn=40);
            //Motor shaft
            color("GOLD") translate([0,8,20.5]) 
            intersection()
            {
            cylinder(r=5/2, h=9, $fn=40);
            cube([3,6,9],center=true);
            }
            //Left mounting lug
            color("SILVER") translate([-35/2,0,18.5]) mountingLug();
            //Right mounting lug
            color("SILVER") translate([35/2,0,18.5]) rotate([0,0,180]) mountingLug();
        
            difference()
            {
                //Cable entry housing
                color("BLUE") translate([-14.6/2,-17,1.9]) cube([14.6,17,17]);
                cylinder(r=27/2, h=29, $fn=60);
            }
        }

        union()
        {
            //Flat on motor shaft
            //translate([-5,0,22]) cube([10,7,25]);
        }
    }

}//end of stepper28BYJ module wrapper




module pulley() {
    difference() {
        union() {
            cylinder(d=13, h=6, $fn=60);
            cylinder(d=10, h=14, $fn=60);
            translate([0,0,13]) cylinder(d=13, h=1, $fn=60);
        }
        translate([0,0,-1]) cylinder(d=5, h=16, $fn=60);
        translate([0,0,3]) rotate([90,0,0]) cylinder(d=3,h=7,$fn=12);
        translate([0,0,3]) rotate([0,90,0]) cylinder(d=3,h=7,$fn=12);
    }
}


module f623zz() {
    difference() {
        union() {
            cylinder(d=11.5, h=1, $fn=60);
            cylinder(d=10, h=4, $fn=60);
        }
        translate([0,0,-1]) cylinder(d=3, h=6, $fn=60);
    }
}

module 625zz() {
    difference() {
        cylinder(d=16, h=5, $fn=60);
        translate([0,0,-1]) cylinder(d=5, h=7, $fn=60);
    }
}



module SK10() {
    difference() {
        union() {
            cube([42,14,6]);
            translate([12,0,0]) cube([18,14,32.8]);
        }
        translate([21,15,20]) rotate([90,0,0]) cylinder(d=10, h=16, $fn=30);
        translate([5,7,-1]) cylinder(d=5.5, h=8, $fn=30);
        translate([37,7,-1]) cylinder(d=5.5, h=8, $fn=30);
        translate([20.5,-1,24]) cube([1,16,10]);
        translate([11,7,29]) rotate([0,90,0]) cylinder(d=3, h=10, $fn=30);
        translate([21,7,29]) rotate([0,90,0]) cylinder(d=4, h=10, $fn=30);        
    }
}

 
module belt() {
    difference() {
        union() {
            translate([6,0,-6]) cube([410,6,12]);
            translate([6,6,0]) rotate([90,0,0]) cylinder(d=12, h=6, $fn=20);
            translate([416,6,0]) rotate([90,0,0]) cylinder(d=12, h=6, $fn=20);
        }
        translate([6,-1,-5]) cube([410,8,10]);
        translate([6,7,0]) rotate([90,0,0]) cylinder(d=10, h=8, $fn=20);
        translate([416,7,0]) rotate([90,0,0]) cylinder(d=10, h=8, $fn=20);    
    }
}


module LM10UU() {
    translate([0,0,-14.5])
    difference() {
        union() {
            translate([0,0,1]) color("black") cylinder(d=18, h=27, $fn=40);
            cylinder(d=19, h=5.5, $fn=40);
            translate([0,0,23.5]) cylinder(d=19, h=5.5, $fn=40);
            translate([0,0,6.8]) cylinder(d=19, h=15.4, $fn=40);
        }
       translate([0,0,-1]) cylinder(d=10, h=57, $fn=40);
    }
}



module TCST2103() {
    difference() {
        union() {
            cube([24.5,6,3.1]);
            translate([6.3,0,0]) cube([11.9,6,10.8]);
        }
        translate([2.75,3,-1]) cylinder(d=3.3, h=5, $fn=10);
        translate([21.75,3,-1]) cylinder(d=3.3, h=5, $fn=10);
        translate([10.7,-1,3.1]) cube([3.1,8,9]);
        
        translate([0,3,8.8]) rotate([0,90,0]) cylinder(d=1, h=30, $fn=10);
    }
}

module endstop() {
    translate([-13.25,-5.5,0])
    difference() {
        union() {
            cube([33,11,1.5]);
            translate([1,2.5,1.5]) TCST2103();
            translate([27,0,-7]) cube([6,10,7]);
        }
        translate([3.75,5.5,-1]) cylinder(d=3.3, h=3, $fn=10);
        translate([22.75,5.5,-1]) cylinder(d=3.3, h=3, $fn=10);
    }
}    




/*module boulonM4(l) {
    cylinder(h=l+1,d=4,$fn=30);
    translate([0,0,l]) 
        intersection() {
        translate([0,0,-0.8]) sphere(r=4,$fn=20);
        cylinder(h=2.1,d=8.8,$fn=20);
    }
}


module boulonM5(l) {
    cylinder(h=l+1,d=5,$fn=30);
    translate([0,0,l]) 
        intersection() {
        translate([0,0,-0.8]) sphere(r=4,$fn=20);
        cylinder(h=2.1,d=8.8,$fn=20);
    }
}


module boulonM3(l) {
    cylinder(h=l+1,d=3,$fn=30);
    translate([0,0,l]) 
        intersection() {
        translate([0,0,-0.8]) sphere(r=3.5,$fn=20);
        cylinder(h=2.1,d=6.8,$fn=20);
    }
}*/





module nut(m) { //Hu 0.8d DIN934 ~ISO4032
    //https://www.cergy-vis.fr/media/emails/images-produit/fixnvis/fr/ECRHUA8ZN.png
    height = [0,0,0,2.4,3.2,4];
    s = [0,0,0,5.5,7,8];
    e = [0,0,0,6.01,7.66,8.79];
    
    difference() {
        translate([0,0,-1*height[m]]) cylinder(h=height[m],d=s[m]/cos(30),$fn=6);
        translate([0,0,-5]) cylinder(h=6,d=m,$fn=fnCylindre);
    }
    echo(str("ECROU;",m));
    
}

module screw(m,h) { //ISO7680
    //https://www.visseriefixations.fr/media/emails/images-produit/fixnvis/fr/TBHCNO.png
    d2 = [0,0,0,5.7,7.6,9.5];
    k = [0,0,0,1.65,2.2,2.75];
    t = [0,0,0,1.04,1.3,1.56];
    s = [0,0,0,2,2.5,3];
    
    translate([0,0,-h]) cylinder(h=h+0.1,d=m,$fn=fnCylindre);
    difference() {
        cylinder(h=k[m],d1=d2[m],d2=d2[m]*0.8,$fn=fnCylindre);
        translate([0,0,k[m] - t[m]]) cylinder(h=5,d=s[m]/cos(30),$fn=6);
    }
}

//screwNut(4,10,30,true);

module screwNut(m,h,h2,displayAxis=false) {
    render() screw(m,h);
    render() translate([0,0,-h2]) nut(m);
    if (displayAxis) rotate([180,0,0]) cylinder(d=0.4, h = h2 + (m * 0.8));
    echo(str("VIS;",m, "x", h));
    
}



/*module boulonDIN(m,h) {
    tete = [0,0,3.8,5.5,7,8.5,10,0,13,0,16,0,18];
    hex = [0,0,1.5,2.5,3,4,5,0,6,0,8,0,10];
    cylinder(h=h+1,d=m,$fn=30);
    difference() {
        translate([0,0,h]) cylinder(h=m,d=tete[m],$fn=20);
        intersection_for(i=[0:60:120])
            rotate([0,0,i]) translate([-hex[m],-hex[m]/2,h+m/2]) cube([hex[m]*2,hex[m],m/2+1]);
    }
    //translate([0,0,2]) ecrou(m,tete[m],m*0.8);
}


module rivet4Assembly(l) {
    render(0) {
        translate([0,0,-l]) cylinder(d=4,h=l,$fn=10);
        intersection() {
            translate([0,0,-1]) sphere(r=4,$fn=20);
            cylinder(h=1,d=8,$fn=20);
        }
        cylinder(d=2,h=40,$fn=10);
        translate([0,0,-l-0.5]) sphere(d=3.5,$fn=10);
    }
}



module rivet4tfAssembly(l) {
    ht = tan(30) * 1.75;
    render(0) {
        translate([0,0,-l]) cylinder(d=4,h=l,$fn=10);
        
        translate([0,0,-ht]) cylinder(h=ht,d2=7.5,d1=4,$fn=20);

        cylinder(d=2,h=40,$fn=10);
        translate([0,0,-l-0.5]) sphere(d=3.5,$fn=10);
    }
}

*/
/*module rivet4(l) {
    render(0) difference() { 
        union() {
            translate([0,0,-l]) cylinder(d=4,h=l,$fn=10);
            intersection() {
                translate([0,0,-1]) sphere(r=4,$fn=20);
                cylinder(h=1,d=8,$fn=20);
            }
            
            intersection() {
                translate([0,0,-l]) sphere(d=5.5,$fn=10);
                translate([-4,-4,-l-4]) cube([8,8,4]);
            }
        }
        
        translate([0,0,-2]) cylinder(d=2,h=3,$fn=10);
    }
}


translate([-10,0,0]) rivet4(8);
translate([10,0,0]) screwNut(4,12,8);
*/






module rondelle(dInt,dExt,epaisseur=0.8) {
    render() linear_extrude(height=epaisseur) difference() {
        circle(d=dExt,$fn=fnCylindre);
        circle(d=dInt,$fn=fnCylindre);
    }
    echo(str("RONDELLE;",dInt, "x", dExt,"x",epaisseur));
}



//  tensionner();

module tensionner(a = 50) {
    a2 = a + atan(1.5/7.5);
    r2 = sqrt(pow(1.5,2)+pow(7.5,2));
    z = cos(a2) * r2 + 0.5;

    translate([0,-0.5,z]) 
    {
        translate([0,8,0]) rotate([90,0,0]) difference() {
            cylinder(d=4,h=9,$fn=20);
            translate([0,0,-1]) cylinder(d=2,h=11,$fn=20);
        }
        
        rotate([0,-a,0]) 
        {
            translate([1.5,-0.5,-7.5]) cylinder(d=1,h=7.5,$fn=12);
            translate([1.5,-0.5,-7.5]) rotate([-90,0,0]) cylinder(d=1,h=8,$fn=12);
            translate([1.5,7.5,-7.5]) cylinder(d=1,h=3.5,$fn=12);
            translate([1.5,-0.5,-7.5]) sphere(d=1,$fn=10);
            translate([1.5,7.5,-7.5]) sphere(d=1,$fn=10);
            
                
        }
        
        
        rotate([0,a,0]) {
            translate([-1.5,7.5,-7.5]) cylinder(d=1,h=7.5,$fn=12);
            translate([-1.5,-0.5,-7.5]) rotate([-90,0,0]) cylinder(d=1,h=8,$fn=12);
            translate([-1.5,-0.5,-7.5]) cylinder(d=1,h=4,$fn=12);
            translate([-1.5,-0.5,-7.5]) sphere(d=1,$fn=10);
            translate([-1.5,7.5,-7.5]) sphere(d=1,$fn=10);
        }
    }
}