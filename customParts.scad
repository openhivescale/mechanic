include <parameters.scad>
include <functions.scad>
include <standardParts.scad>

/////////////////////////////////////////////////
/////             Pièces unitaires          /////
/////////////////////////////////////////////////
module laser206() {
    color(color200)
    translate([2,2,2]) 
    difference() {
        cube([62,62,2]);
        translate([62,18,0]) rotate([0,0,-45]) translate([-80,0,-1]) cube([90,90,4]);
        translate([24,8,-1]) cylinder(d=drillM4, h=4, $fn=fnCylindre);
        translate([46,8,-1]) cylinder(d=drillM4, h=4, $fn=fnCylindre);
        translate([8,24,-1]) cylinder(d=drillM4, h=4, $fn=fnCylindre);
        translate([8,46,-1]) cylinder(d=drillM4, h=4, $fn=fnCylindre);
        
        translate([28,28,-1]) cylinder(d=drillM8, h=4, $fn=fnCylindre);
    }
}


correctionHauteurImpression = pourImpression3D ? 1 : 0;

module laser101() {
    marge = 6;
    hTrou = 5;
    lTrou = 4;    
    largeurCouteau = 12;
    longueurCouteau = offsetCouteau + 2 * marge;
    
    
    hauteurBaseCouteau = lIntCornierCadre - epaisseurTole;
    color(color100)
    render(0) 
    translate([-marge,0,0]) difference() {
        union() {    
            cube([longueurCouteau,hauteurBaseCouteau,epaisseurCouteau]);
            translate([marge,hauteurBaseCouteau+hauteurCouteau-largeurCouteau+correctionHauteurImpression,0]) toleTriangulaire(largeurCouteau,largeurCouteau,epaisseurCouteau);
            translate([marge-largeurCouteau/2,hauteurBaseCouteau,0]) cube([largeurCouteau,hauteurCouteau-largeurCouteau+correctionHauteurImpression,epaisseurCouteau]);
            //translate([marge,hauteurCadre,0]) cube([offsetCouteau/2+5,hTrou+2,epaisseurTole]);
        }    
        
        translate([marge,hauteurBaseCouteau/2,-1])  cylinder(epaisseurCouteau+2,d=diametreRivet, $fn=fnCylindre);
        translate([longueurCouteau-marge,hauteurBaseCouteau/2,-1])  cylinder(epaisseurCouteau+2,d=diametreRivet, $fn=fnCylindre); 
        

        //translate([longueurCouteau/2-lTrou/2,hauteurCadre,-1]) cube([lTrou,hTrou,epaisseurTole+2]);
        translate([marge-2,hauteurBaseCouteau+hauteurCouteau-15,-1]) cube([lTrou,hTrou,epaisseurCouteau+2]);
    }
}


module laser102() {
    marge = 6;
    hTrou = 5;
    lTrou = 4;    
    largeurCouteau = 12;
    longueurCouteau = offsetCouteau + 2 * marge;
    hauteurBaseCouteau = lIntCornierCadre - epaisseurTole;
    color(color100)
    render(0) 
    translate([-marge,0,0]) difference() {
        union() {    
            translate([0,2,0]) cube([largeurCouteau,hauteurBaseCouteau-2,epaisseurCouteau]);
            translate([marge,hauteurBaseCouteau+hauteurCouteau-largeurCouteau+correctionHauteurImpression,0]) toleTriangulaire(largeurCouteau,largeurCouteau,epaisseurCouteau);
            translate([marge-largeurCouteau/2,hauteurBaseCouteau,0]) cube([largeurCouteau,hauteurCouteau-largeurCouteau+correctionHauteurImpression,epaisseurCouteau]);
            //translate([marge,hauteurCadre,0]) cube([offsetCouteau/2+5,hTrou+2,epaisseurTole]);
        }    
        translate([marge,hauteurBaseCouteau/2,-1])  cylinder(epaisseurCouteau+2,d=diametreRivet, $fn=fnCylindre);
        
        translate([marge-2,hauteurBaseCouteau+hauteurCouteau-15,-1]) cube([lTrou,hTrou,epaisseurCouteau+2]);
    }
}


module laser207() {
    l = 28;
    hCorps = 12;
    h = hCorps + epaisseurCouteau;
    zm = -epaisseurTole/2-1;
    
    color(color200)
    render(0) difference() {
        translate([-14,-hCorps,-epaisseurTole/2]) cube([l,h,epaisseurTole]); //tole de base
        translate([-11,0,zm]) cube([l - 3 - 2,h - 2,epaisseurTole+2]);  //décroché
        //translate([14-2,0,zm]) cube([3,epaisseurCouteau+1,epaisseurTole+2]); // coin gauche
        translate([-11,-1,zm]) cube([7,2,epaisseurTole+2]); //decroché2
        translate([-15,3.5,zm]) cube([7,2,epaisseurTole+2]); // on enlève 5/10 pour ne pas avoir de frotement sur le montage bras secondaire
        intersection() { //décrohé biais
            translate([-5,-1,zm]) cube([7,2,epaisseurTole+2]);
            translate([0,0,zm]) rotate([0,0,20]) translate([-7,0,0]) cube([8,2,epaisseurTole+2]);
        }
        
        translate([4,-hCorps+4,zm]) cube([4,9,epaisseurTole+2]); // trou boulon
        translate([6-7/2,-hCorps+7,zm]) cube([7,3.4,epaisseurTole+2]); // emplacement écrou
    }
}




module laser106() {
    l = 64;
    h = 28 ;
    hauteurTriangle = h/2+1;
    baseTriangle = hauteurTriangle * 4;
    
    color(color100)
    render(0) 
    difference() {
        //tole de base
        cube([l,h,epaisseurCouteau]);
        
        
        //premier emplacement contre couteau
        intersection() {
            translate([36,-1,-1]) rotate([0,0,0]) toleTriangulaire(baseTriangle,hauteurTriangle,epaisseurCouteau+2); 
            translate([28,-1,-1]) cube([16,h/2+1,epaisseurCouteau+2]);    
        }        
        
        //second emplacement contre couteau
        intersection() {
            translate([56,h/2+hauteurTriangle,-1]) rotate([0,0,180]) toleTriangulaire(baseTriangle,hauteurTriangle,epaisseurCouteau+2); 
            translate([48,h/2,-1]) cube([17,h/2+1,epaisseurCouteau+2]);
        }
               
        //Trou carré pour le tube
        
        translate([4-laserSlack/2,4-laserSlack/2,-1]) cube([20+laserSlack,20+laserSlack,epaisseurCouteau+2]);
        
        translate([4+epaisseurTole,4-epaisseurTole-laserSlack,-1]) cube([20-2*epaisseurTole,20+2*epaisseurTole + 2 * laserSlack,epaisseurCouteau+2]);
        
        //Trous pour les tôles de centrage  
        translate([36,h/2+4+2,-1]) cylinder(d=drillM4,h=epaisseurCouteau+2, $fn=fnCylindre);
        translate([56,h/2-4-2,-1]) cylinder(d=drillM4,h=epaisseurCouteau+2, $fn=fnCylindre);
        
        translate([36-epaisseurTole/2,h/2+12-laserSlack,-1]) cube([epaisseurTole,2+1,epaisseurCouteau+2]);
        translate([56-epaisseurTole/2,-1+laserSlack,-1]) cube([epaisseurTole,2+1, epaisseurCouteau+2]);
    }
}


module laser201() {
    color(color200)
    render(0) 
    difference() {
        translate([-10,0,0]) cube([20,2+epaisseurCouteau+12,epaisseurTole]);
        translate([-11+laserSlack,epaisseurTole-laserSlack/2,-1]) cube([epaisseurTole+1,epaisseurCouteau+laserSlack,epaisseurTole+2]);
        translate([10-epaisseurTole-laserSlack,epaisseurTole-laserSlack/2,-1]) cube([epaisseurTole+1,epaisseurCouteau+laserSlack,epaisseurTole+2]);
        translate([0,2+epaisseurCouteau+6,-1]) cylinder(d=drillM4,h=epaisseurTole+2, $fn=fnCylindre);
    }
}



module laser103() {
    l = 54;
    lt = 30;
    color(color100)
    render(0) 
    difference() {
        translate([-l/2,-14,0]) cube([l,24,epaisseurCouteau]);
        translate([-lt/2,-11,-1]) cube([lt,15,epaisseurCouteau+2]);
        translate([-lt/2,-12,-1]) cube([lt,16,epaisseurCouteau+2]);
        translate([-lt/2+4,-15,-1]) cube([lt-8,4,epaisseurCouteau+2]);
        
        translate([-21,0,-1]) cylinder(d=drillM4,h=epaisseurCouteau+2, $fn=fnCylindre);//oblong(4,2,6);
        translate([21,0,-1])  cylinder(d=drillM4,h=epaisseurCouteau+2, $fn=fnCylindre);//oblong(4,2,6);         
    }
    
    translate([0,7,0]) rotate([0,0,180]) toleTriangulaire(7,7,epaisseurCouteau);
}


module laser104() {
    l = 26;
    h = 12;
    
    color(color100)
    render(0) 
    difference() {

        //tole de base
        translate([-l/2,-10,0]) cube([l,h,epaisseurCouteau]);
    
        //Trou carré pour le tube
        translate([-5,0,-1]) cube([10,3,epaisseurCouteau+2]);
        
        //Trous 
        translate([-8,-4,-1]) cylinder(d=drillM4,h=epaisseurCouteau+2, $fn=fnCylindre);
        translate([8,-4,-1]) cylinder(d=drillM4,h=epaisseurCouteau+2, $fn=fnCylindre); 
    }
}



module laser209() {
    color(color200)
    render(0) 
    translate([-3,-13,-epaisseurTole/2]) difference() {
        cube([28,26,epaisseurTole]);
		translate([-1,3-laserSlack/2,-1]) cube([4,20+laserSlack,epaisseurTole+2]);
        intersection() {
            translate([29,14,-1]) rotate([0,0,-45]) translate([-35,0,0]) cube([40,20,epaisseurTole+2]);
            translate([0,17,-1]) cube([50,20,epaisseurTole+2]);
        }
        translate([11-laserSlack,13,-1]) cube([20,epaisseurTole,epaisseurTole+2]);
        
        //#intersection() {
        translate([24,11,-1]) rotate([0,0,45]) translate([-40,-20,0]) cube([40,20,epaisseurTole+2]);
        translate([24,13,-1]) rotate([0,0,-20]) translate([0,-20,0]) cube([40,20,epaisseurTole+2]);
            //translate([0,-1,-1]) cube([50,15,epaisseurTole+2]);
        translate([24,13,-1]) rotate([0,0,0]) translate([0,-20,0]) cube([40,20,epaisseurTole+2]);
            //translate([0,-1,-1]) cube([50,15,epaisseurTole+2]);
        //}
    }
}





module laser208() {
    color(color200)
    translate([0,0,0]) difference() {
        translate([0,-16,0]) cube([25,32,epaisseurTole]);
        
        for (z=[-10,10]) {
            translate([-1,z-4/2,-1]) cube([8,4,epaisseurTole+2]); // trou boulon
            translate([2,z-7/2-laserSlack/2,-1]) cube([3.4,7,epaisseurTole+2]); // emplacement écrou
        }
        
        translate([-1+laserSlack,-epaisseurTole/2,-1]) cube([9+laserSlack,epaisseurTole,epaisseurTole+2]);
        
        
        translate([20,5,-1]) rotate([0,0,-45]) translate([-20,0,0]) cube([20,30,epaisseurTole+2]);
        translate([20,5,-1]) cube([20,12,epaisseurTole+2]);
        
        translate([20,-5,-1]) rotate([0,0,45]) translate([-20,-30,0]) cube([20,30,epaisseurTole+2]);
        translate([20,-5-12,-1]) cube([20,12,epaisseurTole+2]);
    }
}




module laser107() {
    l = 32;
    h = 14;
    marge = 6;
    hTrou = 5;
    lTrou = 4;    
    largeurCouteau = 10;
    longueurCouteau = offsetCouteau + 2 * marge;
    hauteurBaseCouteau = lIntCornierCadre - epaisseurTole;
    
    color(color100)
    render(0) 
    difference() {
        union() {    
            translate ([-l/2,10,0]) cube([l,h,epaisseurCouteau]);
            translate([0,largeurCouteau,0]) rotate([0,0,180]) toleTriangulaire(largeurCouteau,largeurCouteau,epaisseurCouteau);
        }    
        translate([-10,10+h/2,-1])  cylinder(epaisseurCouteau+2,d=diametreRivet, $fn=fnCylindre);
        translate([10,10+h/2,-1])  cylinder(epaisseurCouteau+2,d=diametreRivet, $fn=fnCylindre); 
        

        //translate([longueurCouteau/2-lTrou/2,hauteurCadre,-1]) cube([lTrou,hTrou,epaisseurTole+2]);
        translate([-lTrou/2,10,-1]) cube([lTrou,hTrou,epaisseurCouteau+2]);
    }
}


module laser108() {
    l = 46;
    h = 29;
    marge = 6;
    hTrou = 5;
    lTrou = 4;    
    largeurCouteau = 7;
    longueurCouteau = offsetCouteau + 2 * marge;
    hauteurBaseCouteau = lIntCornierCadre - epaisseurTole;
    
    color(color100)
    render(0) 
    difference() {
        translate ([-16,-10,0]) cube([l,h,epaisseurCouteau]);
        
        translate ([-17,-11,-1]) cube([27,18,epaisseurCouteau+2]);
        translate ([20-16/2,-7,-1]) cube([16,14,epaisseurCouteau+2]);

        translate([-10,13,-1])  cylinder(epaisseurCouteau+2,d=drillM4, $fn=fnCylindre);
        translate([20,13,-1])  cylinder(epaisseurCouteau+2,d=drillM4, $fn=fnCylindre); 
        

        //translate([longueurCouteau/2-lTrou/2,hauteurCadre,-1]) cube([lTrou,hTrou,epaisseurTole+2]);
        translate([-lTrou/2,10,-1]) cube([lTrou,hTrou,epaisseurCouteau+2]); //trouCarre
    }
    color(color100) translate([0,largeurCouteau,0]) rotate([0,0,180]) toleTriangulaire(largeurCouteau,largeurCouteau,epaisseurCouteau);
    color(color100) translate([20,-largeurCouteau,0]) toleTriangulaire(largeurCouteau,largeurCouteau,epaisseurCouteau);
    
}




module laser105() {
    l = 26;
    h = zCouteau - 4 + 5;
    hauteurTriangle = h/2+1;
    baseTriangle = hauteurTriangle * 4;
    hauteurSousCouteau = zCouteau - 4;
        
    color(color100)
    render(0) 
    difference() {
        difference() {
            //tole de base
            translate([-l/2,-hauteurSousCouteau,0]) cube([l,h,epaisseurCouteau]);
            translate([7,-hauteurSousCouteau + 18,-1]) cube([10,30,epaisseurCouteau+2]);
            translate([-17,-hauteurSousCouteau + 18,-1]) cube([10,30,epaisseurCouteau+2]);
            
        }
        
        //premier emplacement contre couteau
        //intersection() {
            translate([0,hauteurTriangle,-1]) rotate([0,0,180]) toleTriangulaire(baseTriangle,hauteurTriangle,epaisseurCouteau+2); 
        //    translate([-8,0,-1]) cube([16,h/2+1,epaisseurCouteau+2]);    
        //}        
        
        
        //Trous pour les tôles de centrage
        translate([-epaisseurTole/2-laserSlack,-14-laserSlack,-1]) cube([epaisseurTole+2*laserSlack,2+2*laserSlack,epaisseurCouteau+2]);
        translate([-2,-17,-1]) cube([4,3,epaisseurCouteau+2]);
        translate([0,-4-2,-1]) cylinder(d=4,h=epaisseurCouteau+2, $fn=fnCylindre); //boulon
        
        translate([-8,-hauteurSousCouteau+10,-1]) cylinder(d=drillM4,h=epaisseurCouteau+2, $fn=fnCylindre);
        translate([8,-hauteurSousCouteau+10,-1]) cylinder(d=drillM4,h=epaisseurCouteau+2, $fn=fnCylindre);
        
    }
}



//!laser105();

module oblong(d,lLiberte,h) {
    color(color100)
    hull() {
        translate([-lLiberte/2,0,0])  cylinder(h,d=d, $fn=fnCylindre); 
        translate([lLiberte/2,0,0])  cylinder(h,d=d, $fn=fnCylindre); 
    }    
    
}





//!toleCentrageCouteau3();
module drill205(h) {
    translate([35,10,-1]) cylinder(d=diametreRivet,h=h, $fn=fnCylindre);        
    translate([65,10,-1]) cylinder(d=diametreRivet,h=h, $fn=fnCylindre);        
    translate([95,10,-1]) cylinder(d=diametreRivet,h=h, $fn=fnCylindre);   
}


module laser205() {
    l = 105;
    h = 28;
    hauteurTriangle = h/2+1;
    baseTriangle = hauteurTriangle * 4;
        
    color(color200)
    render(0) 
    difference() {
        //tole de base
        linear_extrude(epaisseurTole) 
        difference() {
            hull() {
                translate([0,-4]) square([28,28]);
                translate([95,10]) circle(r=8);
            }
                      
            
            translate([4-laserSlack,0-laserSlack]) square([20+2*laserSlack,20+2*laserSlack]);
            
            //for (x=[4.4,23.6],y=[0.4,19.6])
            //    translate([x,y]) circle(r=0.8, $fn=20);
            
            
        }
        drill205(epaisseurTole+2);               

    }
}



module laser202() {
    color(color200)
    render(0) 
    difference() {
        cube([20,20,epaisseurTole]);
        translate([10,10,-1]) cylinder(d=diametreRivet,h=epaisseurTole+2, $fn=fnCylindre);  
    }
}






module laser210() {
    wHole = sqrt(pow(19/2,2)-pow(7,2)) * 2;
    w = 46;
    l = 59;
    color(color200)
    render(0) 
    linear_extrude(height=epaisseurTole) {
        difference() {

            
            translate([0,-w/2]) square([l,w]);

            translate([2,-wHole/2]) square([55,wHole]);
            
            for (x=[4.5,54.5],y=[-12,12])
                translate([x,y]) circle(d=drillM4,$fn=fnCylindre); 

            //for (x=[13,43],y=[-16,-12,10,14])
            for (x=[11,41],y=[-12.5,10])
                translate([x,y]) square([5,2.5]); 

            translate([l/2,12]) circle(d=3,$fn=fnCylindre);       
        }
    
    }
}


module laser213() {
    w = 46;
    l = 33;
    wHole = sqrt(pow(19/2,2)-pow(7,2)) * 2;
    
    color(color200)
    render(0) 
    linear_extrude(height=epaisseurTole) {
        difference() {

            
            translate([-l/2,-w/2]) square([l,w]);

            translate([-l/2+2,-wHole/2]) square([29,wHole]);
            
            for (x=[-l/2+4.5,-l/2+28.5],y=[-12,12])
                translate([x,y]) circle(d=drillM4,$fn=fnCylindre); 

            //for (x=[13,43],y=[-16,-12,10,14])
            //for (x=[-l/2+8,-l/2+20],y=[-12.5,10])
            for (x=[-6-2.5,6-2.5],y=[-12.5,10])
                translate([x,y]) square([5,2.5]); 

            translate([0,12]) circle(d=3.1,$fn=fnCylindre);       
        }
    
    }
}


module laser211() {
    color(color200)
    render(0) 
    linear_extrude(height=epaisseurTole) {
        difference() {
            
            translate([-4.5,-2.5]) square([9,11]);
            for (x=[-3.5:2:3.5])
                translate([x,2.5]) square([1,7]);
            translate([0,0]) circle(d=3.1,$fn=fnCylindre);
        }
    }
}



module laser212() {
    color(color200)
    render(0) 
    linear_extrude(height=epaisseurTole) {
        difference() {
            translate([-4.5,-2.5]) square([9,11]);
            translate([0,0]) circle(d=3.1,$fn=fnCylindre);
        }
    }
}


//projection() laser203();
module laser203() {
    hBase = 24.8;
    color(color200)
    render(0) 
    difference() {
        union() {
            translate([-14,0]) cube([36,hBase, epaisseurTole]) ;
            translate([9.5-sqrt(1.25),hBase-1,0]) cube([sqrt(1.25)*2,7.2,epaisseurTole]); //ergot centrage
            
            translate([15,0,0]) cube([7,70,2]);
            translate([-4,66,0]) cube([26,4,2]);
        }
        
        translate([-9.5-(3+jeuPourImpression)/2,hBase-8,-1]) cube([3+jeuPourImpression,10,epaisseurTole+2]); // trou boulon
        translate([-9.5-(5.6+jeuPourImpression)/2,hBase-5,-1]) cube([5.5+jeuPourImpression,2.6+jeuPourImpression,epaisseurTole+2]); // emplacement écrou
        
        
        //fixation holes
        translate([-6.5,9,-1]) cylinder(d=drillM4,h=epaisseurTole+2, $fn=fnCylindre);
        translate([15.5,9,-1]) cylinder(d=drillM4,h=epaisseurTole+2, $fn=fnCylindre);
    }
    
    if (pourImpression3D == 1) {
        translate([-13.5,hBase-9,0]) cube([30,18,0.2]);
    }
}




module laser252() {
     linear_extrude(height=1/*epaisseurTole*/) {
        difference() {
            union() {
                translate([0,-10-3]) square([12,28+3]); 
                translate([-2,4-sqrt(4)-jeuPourImpression/2]) square([2,sqrt(4)*2-jeuPourImpression]);
                //translate([-3,-13]) square([5,13]);
            }
            translate([0,12-(4+jeuPourImpression)/2]) square([9,4+jeuPourImpression]); // trou boulon
            translate([2.5,12-(7+jeuPourImpression)/2]) square([3.4+jeuPourImpression,7+jeuPourImpression]); // emplacement écrou
            
            translate([2,-10-(jeuPourImpression/2)]) square([8+jeuPourImpression,4+jeuPourImpression]); // fenetre passante
        }
        
    }
    
    if (pourImpression3D == 1) {
        translate([-5,4,0]) cube([6.5,14,0.2]);
    }
}



module laser215() {
     linear_extrude(height=epaisseurTole) {
        difference() {
            square([60,100]); 
            translate([60,20]) rotate(atan(40/80)) translate([0,0]) square([100,200]); 
            
            translate([10,10]) circle(d=drillM4,$fn=fnCylindre);
            translate([50,10]) circle(d=drillM4,$fn=fnCylindre);
            translate([10,30]) circle(d=drillM4,$fn=fnCylindre);
            translate([10,90]) circle(d=drillM4,$fn=fnCylindre);
        }
    }
}


module laser216() {
    linear_extrude(height=2) {
        rotate(-30) union() {
            difference() {
                union() {
                    circle(d=36,$fn=100);
                    translate([-11,-17.5-2]) square([22,10]);
                }
                circle(d=28.5,$fn=36);
                translate([-8.75,-17.5]) square([17.5,10]);
            }
            
        }
        
        translate([sin(30)*8-5,15]) square([10,6.7]);
        translate([sin(30)*8-1.3,24-4.2]) square([2.6,5]);
    }
}



module laser251() {
    difference() {
        linear_extrude(height=1) {
            difference() {
                circle(d=27,$fn=fnCylindre);
                intersection() {
                    circle(d=5.1,$fn=fnCylindre);
                    translate([-3,-1.525]) square([6,3.05]);
                }
                    
                translate([-1,6]) square([2,6]);
            }
        }
        
        //translate([0,0,0.2]) cylinder(d=13,h=2,$fn=100);
    }
}


module laser281() {
        linear_extrude(height=6) 
        difference() {
            translate([-117/2,-45/2]) square([117,45]);
            for (x=[-12,12],y=[-12,12]) {
                translate([x,y]) circle(d=4, $fn=fnCylindre);
            }
        }
}



module profile301() {
    zTrou = epaisseurTole+eCorniereCadre+(lCorniereCadre-epaisseurTole-eCorniereCadre)/2;
    color(color300)
    render(0) 
    difference() {
        cornierePercee(longueur);
        for (x1=[xCouteauInferieur,xCouteauSuperieur],x2=[0,1]) {
            translate([longueur*x2+(1-2*x2)*x1,eCorniereCadre+1,zTrou]) rotate([90,0,0]) cylinder(eCorniereCadre+2,d=diametreRivet, $fn=fnCylindre);
        }
    }
}

module profile302() {
    color(color300)
    render(0) 
    difference() {
        cornierePercee(largeur);
        for (x=[yMediane-ySupportFromMediane,yMediane+ySupportFromMediane]) {
            translate([x,10,-1]) cylinder(eCorniereCadre+2,d=drillM4, $fn=fnCylindre);
        }
    }
}

module profile303() {
    color(color300)
    render(0) 
    difference() {
        corniere(20,l303304,2);
        for (x=[8,longueur-2*eCorniereCadre-8]) 
            translate([x,10,-1]) cylinder(eCorniereCadre+2,d=diametreRivet, $fn=fnCylindre);
        for (x=[xBrasSecondaire2-8-2,xBrasSecondaire2+8-2]) 
            translate([x,-1,12]) rotate([-90,0,0]) cylinder(eCorniereCadre+2,d=diametreRivet, $fn=fnCylindre); 
 
        translate([xObturateur-15.5-2,-1,11]) rotate([-90,0,0]) cylinder(eCorniereCadre+2,d=diametreRivet, $fn=fnCylindre); 
        translate([xObturateur+6.5-2,-1,11]) rotate([-90,0,0]) cylinder(eCorniereCadre+2,d=diametreRivet, $fn=fnCylindre); 
        
        
        for (x=[x308-10,x309+10])
            translate([x-2,10,-1]) cylinder(eCorniereCadre+2,d=drillM4, $fn=fnCylindre); 
    }
}


module profile308() {
    //echo(l308309);
    difference() {
        corniere(20,l308309,2);
        translate([8,10,-1]) cylinder(eCorniereCadre+2,d=diametreRivet, $fn=fnCylindre);
    }
}

module profile309() {
    //echo(l308309);
    difference() {
        corniere(20,l308309,2);
        translate([l308309-8,10,-1]) cylinder(eCorniereCadre+2,d=diametreRivet, $fn=fnCylindre);
    }
}




module profile304() {
    color(color300)
    render(0) 
    difference() {
        corniere(20,l303304,2);
        for (x=[8,longueur-2*eCorniereCadre-8]) 
            translate([x,10,-1]) cylinder(eCorniereCadre+2,d=diametreRivet, $fn=fnCylindre);
        for (x=[longueur-(xBrasSecondaire2-8)-2,longueur-(xBrasSecondaire2+8)-2]) 
            translate([x,-1,12]) rotate([-90,0,0]) cylinder(eCorniereCadre+2,d=diametreRivet, $fn=fnCylindre);        
    }
}




module profile305() {
    render(0) 
    difference() {
        translate([0,0,30]) rotate([-90,0,0]) corniere(30,lBrasSecondaire,2);
        for (x=[7,lBrasSecondaire-30]) translate([x,largeurBras/2-16,27]) cylinder(d=5, h=4, $fn=fnCylindre);
            
        //fixation couteauIII
        translate([lBrasSecondaire-xCouteauIII-10,-1,zCouteauBrasSecondaire+13]) rotate([-90,0,0]) cylinder(d=4, h=4, $fn=fnCylindre);
        translate([lBrasSecondaire-xCouteauIII+20,-1,zCouteauBrasSecondaire+13]) rotate([-90,0,0]) cylinder(d=4, h=4, $fn=fnCylindre);
        
        
        //fixation roulement 625zz
        //translate([lBrasSecondaire-xMotor,3,zMotor]) rotate([90,0,0]) 625zz();
        translate([lBrasSecondaire-xMotor,-1,zMotor+8+1.5]) rotate([-90,0,0]) cylinder(d=3, h=4, $fn=fnCylindre);
        translate([lBrasSecondaire-xMotor-sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),-1,3.5]) rotate([-90,0,0]) cylinder(d=3, h=4, $fn=fnCylindre);
        translate([lBrasSecondaire-xMotor+sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),-1,3.5]) rotate([-90,0,0]) cylinder(d=3, h=4, $fn=fnCylindre);
    }  
}

//profile306();

module profile306() {
    render(0) 
    difference() {
        translate([0,0,30]) rotate([-90,0,0]) corniere(30,lBrasSecondaire,2);
        for (x=[30,lBrasSecondaire-7]) translate([x,largeurBras/2-16,27]) cylinder(d=5, h=4, $fn=fnCylindre);
        
        //fixation moteur
        /*translate ([xMotor,-1,zMotor]) rotate([0,-150,0]) {
            translate([0,0,0]) rotate([-90,0,0]) cylinder(d=9.5, h=4);
            translate([-35/2,0,-8]) rotate([-90,0,0]) cylinder(d=4, h=4, $fn=fnCylindre);
            translate([35/2,0,-8]) rotate([-90,0,0]) cylinder(d=4, h=4, $fn=fnCylindre);
        }*/
        
        translate([xMotor,0,zMotor]) rotate([-90,0,0]) cylinder(d=9.5, h=4);
        translate([xMotor+fixMoteur1X,0,zMotor+fixMoteur1Y]) rotate([-90,0,0]) cylinder(d=4, h=4, $fn=fnCylindre);
        translate([xMotor-fixMoteur2X,0,zMotor+fixMoteur2Y]) rotate([-90,0,0]) cylinder(d=4, h=4, $fn=fnCylindre);
        
        
        
        //poulie libre
        translate([xPulley,-1,zMotor]) rotate([-90,0,0]) cylinder(d=3, h=4, $fn=fnCylindre);
        
        //fixation couteauIII
        translate([xCouteauIII-20,-1,zCouteauBrasSecondaire+13]) rotate([-90,0,0]) cylinder(d=4, h=4, $fn=fnCylindre);
        translate([xCouteauIII+10,-1,zCouteauBrasSecondaire+13]) rotate([-90,0,0]) cylinder(d=4, h=4, $fn=fnCylindre);
        
        
        //fixation obturateur
        //for (z=[4,12]) 
        for (z=[9,17]) 
            translate([longueur-xBrasSecondaire-xObturateur,-1,z]) rotate([-90,0,0]) cylinder(d=4, h=4, $fn=fnCylindre);
        
        //echo(lBrasSecondaire);
        //echo(longueur-xBrasSecondaire-xObturateur);
    }
}





module tube311() {
    xTrouFixation = epaisseurTole+epaisseurCouteau+6;
    color(color310)
    render(0) 
    difference() {
        tubeCarre(20, largeur, 2);

        translate([xTrouFixation,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);
        translate([largeur-xTrouFixation,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);
        
        translate([y312,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);
        translate([y312-40,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);   
        
        translate([largeur-y312,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);
        translate([largeur-(y312-40),10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);   
    }
}

//tube313();
//translate([2+y312+10,2+20,20-2]) rotate([0,0,180]) laser206();


module tube312() {
    color(color310)
    render(0) 
    difference() {
        tubeCarre(20, 251, 2);
        //translate([-24,20,0]) rotate([90,0,0]) drill205(22);
   
        translate([longueur/2-26-21,-1,10]) rotate([-90,0,0]) cylinder(d=diametreRivet,h=22, $fn=fnCylindre);
        translate([longueur/2-26+21,-1,10]) rotate([-90,0,0]) cylinder(d=diametreRivet,h=22, $fn=fnCylindre); 
        
        translate([10,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);
        translate([70,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);   
        
    }
}




module tube313() {
    xTrouFixation = epaisseurTole+epaisseurCouteau+6;
    color(color310)
    render(0) 
    difference() {
        tubeCarre(20, largeur, 2);

        translate([xTrouFixation,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);
        translate([largeur-xTrouFixation,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);

        translate([y314,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);
        translate([y314-40,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);          

        translate([largeur-y314,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);
        translate([largeur-(y314-40),10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);    
    }
}

module tube314() {
    
    color(color310)
    render(0) 
    difference() {
        tubeCarre(20, l314, 2);
        //translate([-24,20,0]) rotate([90,0,0]) drill205(22);
    
        translate([longueur/2-26-8,-1,6]) rotate([-90,0,0]) cylinder(d=diametreRivet,h=22, $fn=fnCylindre);
        translate([longueur/2-26+8,-1,6]) rotate([-90,0,0]) cylinder(d=diametreRivet,h=22, $fn=fnCylindre);         
        translate([xAppuiLong-26-10,-1,11]) rotate([-90,0,0]) cylinder(d=drillM4,h=22, $fn=fnCylindre);
        translate([xAppuiLong-26+10,-1,11]) rotate([-90,0,0]) cylinder(d=drillM4,h=22, $fn=fnCylindre);
        
        translate([10,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);
        translate([70,10,-1]) cylinder(d=diametreRivet, h=22, $fn=fnCylindre);   
    }
}

/*module contrePoids315() {
    difference() {
        translate([-51,-20,0]) cube([102,40,8]);
        
        for (x=[-12,12],y=[-12,12]) {
            translate([x,y,-1]) cylinder(d=4,h=10, $fn=10);
        }
    }
}*/


module arbre321() {
    rotate([-90,0,0]) cylinder(d=5,h=48,$fn=fnCylindre);
}



//translate([0,0,10]) laser213();

//contrePoids315();
//profile303();
//projection() laser251();


module printed601() {
    difference() {
        union() {
            translate([0,0,2]) cylinder(d=11.5,h=3,$fn=128);
            cylinder(d=16,h=2,$fn=128);
        }
        translate([0,0,-1]) cylinder(d=6.2,h=7,$fn=128);
        translate([-20,-1,-1]) cube([20,2,7]);
    }
}
    
//printed602();
//pulley();
module printed602() {
    dInt = 13 + 0.5;

    linear_extrude(height=1) {
        difference() {
            circle(d=27,$fn=fnCylindre);
            translate([-1,-12]) square([2,4.5]);
            circle(d=dInt,$fn=fnCylindre);
        }
    }

    difference() {
        //union() {
            difference() {
                translate([0,0,0]) cylinder(d=dInt+1,h=6-0.5,$fn=fnCylindre);
                translate([0,0,-1]) cylinder(d=dInt,h=8,$fn=fnCylindre);
            }
            //translate([6.3,0,3-0.5]) rotate([0,90,0]) cylinder(d=3.4,h=0.5,$fn=12);
            //translate([0,6.3,3-0.5]) rotate([-90,0,0]) cylinder(d=3.4,h=0.5,$fn=12);
        //}
        translate([0,0,3-0.5]) rotate([-90,0,0]) cylinder(d=3,h=10,$fn=12);
        translate([0,0,3-0.5]) rotate([0,90,0]) cylinder(d=3,h=10,$fn=12);
    }
    
    
    
}


module protection701() {
    difference() {
        translate([0,-55,-10]) cube([longueur-4,110,10]);
        translate([-1,-54.4,-11]) cube([longueur,110-2*0.6,10.6]);
        for (x=[8,longueur-4-8],y=[-ySupportFromMediane,ySupportFromMediane]) 
            translate([x,y,-1]) cylinder(d=drillM4,h=3);
    }
}
    