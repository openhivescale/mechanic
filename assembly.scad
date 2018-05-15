include <parameters.scad>
include <functions.scad>
include <customParts.scad>
include <standardParts.scad>

/////////////////////////////////////////////////
/////             Assemblages               /////
/////////////////////////////////////////////////
module motorPulley() {
    translate([0,-8,-19]) stepper28BYJ();
    color("SILVER") translate([0,0,2.5]) pulley();
}


//assemblageGlobal();

//cadreInf();
//translate([0,0,2]) brasSecondaire();
//translate([0,0,-2.0]) brasSecondaire();
//laser252();

//brasSecondaire();

//assemblageTriangle1();
//assemblageTriangle2();


//cadreInf();

//brasSecondaire([2,4,7]);

module brasSecondaire(animation=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],moveInFinalPlace=true,offsetContrepoids = 250) {

  
    
    xContrePoids = xMotor + offsetContrepoids; 
    xTensionner = xMotor + 400 - offsetContrepoids;
    
    xFinal = moveInFinalPlace ? longueur-xBrasSecondaire : 0; 
    yFinal = moveInFinalPlace ? largeur/2+largeurBras/2 : 0; 
    zFinal = moveInFinalPlace ? zBrasSecondaire : 0; 
    rzFinal = moveInFinalPlace ? 180 : 0; 
    
    translate([xFinal,yFinal,zFinal]) rotate([0,0,rzFinal]) {
        ///////////////arbre/////////////////
        if (search(0,animation)) {
             color("red") translate([23,largeurBras/2,8]) tube(10,6,lBrasSecondaire-23); 
        }
        
        
        if (search(1,animation)) {
            translate([xContrePoids,largeurBras/2,8]) rotate([0,90,0]) LM10UU();
        }

        if (search(2,animation)) {
            translate([xContrePoids,largeurBras/2,15]) rotate([0,0,180]) laser213();
        }
        if (search(3,animation)) {
            translate([xContrePoids-6,largeurBras/2,8]) rotate([90,0,90]) serflex213();
            translate([xContrePoids+6,largeurBras/2,8]) rotate([90,0,90]) serflex213();
        }
        
        if (search(4,animation)) {
            for (x=[-12,12]) {
                for (y=[-12,12]) {
                    translate([xContrePoids+x,largeurBras/2+y,17]) screwNut(4,50,46);
                    translate([xContrePoids+x,largeurBras/2+y,-13.8]) nut(4);
                }
                translate([xContrePoids+x,largeurBras/2+12,14.8]) nut(4);
            }
        }
        
        if (search(5,animation)) {
            translate([xContrePoids,largeurBras/2,-23]) laser281();
            translate([xContrePoids,largeurBras/2,-29]) laser281();        
        }
        
        if (search(6,animation)) {
            difference() {
                translate([xMotor-9,9,zMotor]) belt();        
                translate([xTensionner-5.8,8,0]) cube([11.6,10,6]);
            }
            
            translate([xTensionner,9,2]) {
                tensionner();
                translate([-5.8,0,-1]) rotate([0,-57,0]) cube([7.6,6,1]);
                translate([5.8,6,-1]) rotate([0,-57,180]) cube([7.6,6,1]);
                translate([0,6,4.2]) rotate([90,0,0]) intersection() {
                    difference() {
                        cylinder(d=6.1,h=6,$fn=20);
                        translate([0,0,-1]) cylinder(d=4,h=8,$fn=20);
                    }
                    translate([-5,1,-1]) cube([10,10,10]);
                }
            }
            
        }
        

        if (search(7,animation)) {
            translate([xContrePoids,largeurBras/2-12,10.2]) rotate([0,0,180]) laser211();
            translate([xContrePoids,largeurBras/2-12,13]) rotate([0,0,180]) laser212();        
            translate([xContrePoids,largeurBras/2-12,17]) screwNut(3,10,6.8); 
            
            translate([xContrePoids,largeurBras/2-12,12.2]) rondelle(3,6);
            
            
        }

        if (search(8,animation)) {
            translate([xPulley,16,zMotor]) rotate([90,0,0]) f623zz();
            translate([xPulley,8,zMotor]) rotate([-90,0,0]) f623zz();       
            translate([xPulley,0,zMotor]) rotate([90,0,0]) screwNut(3,20,16);
            translate([xPulley,2,zMotor]) rotate([-90,0,0]) rondelle(3,8,5);
            
            
        }

        if (search(9,animation)) {
            translate([xMotor,0,zMotor]) rotate([-90,30,0]) motorPulley();
            translate([xMotor+fixMoteur1X,-0.5,zMotor+fixMoteur1Y]) rotate([90,0,0]) screwNut(4,10,2.5);
            translate([xMotor-fixMoteur2X,-0.5,zMotor+fixMoteur2Y]) rotate([90,0,0]) screwNut(4,10,2.5);
            
            
            //translate([xMotor,4,zMotor]) rotate([-90,0,180]) laser251();
            translate([xMotor,3,zMotor]) rotate([-90,0,0]) rotate([0,0,-60]) printed602();
            
            
            
            

            
        }

        if (search(10,animation)) {
            translate([xCouteauIII,largeurBras+spacer108,zCouteauBrasSecondaire]) rotate([90,0,180]) laser108();
            translate([xCouteauIII,-epaisseurCouteau-spacer108,zCouteauBrasSecondaire]) rotate([90,0,180]) laser108();        
            for (x=[xCouteauIII+10,xCouteauIII-20]) {
                translate([x,largeurBras+4.8,zCouteauBrasSecondaire+13]) rotate([-90,0,0]) screwNut(4,10,6.8);
                translate([x,-4.8,zCouteauBrasSecondaire+13]) rotate([90,0,0]) screwNut(4,10,6.8);
                        
                translate([x,largeurBras,zCouteauBrasSecondaire+13]) rotate([-90,0,0]) rondelle(4,8,0.8);
                translate([x,0,zCouteauBrasSecondaire+13]) rotate([90,0,0]) rondelle(4,8,0.8);
            }
        }

        
        if (search(11,animation)) {
            translate([23,largeurBras/2-21,28]) rotate([180,0,90]) SK10();
            translate([lBrasSecondaire-14,largeurBras/2-21,28]) rotate([180,0,90]) SK10();    
            for (x=[30,lBrasSecondaire-7],y=[-16,16])
                translate([x,largeurBras/2+y,30]) screwNut(5,12,8);
        }    
        
            
        if (search(12,animation)) {
            profile306();
            
        }

        if (search(13,animation)) {
            translate([lBrasSecondaire,largeurBras,0])  rotate([0,0,180]) profile305();
        }
     
        if (search(14,animation)) {
            translate([longueur-xBrasSecondaire-xObturateur+0.5,0,5])  rotate([90,0,-90]) laser252();
            translate([longueur-xBrasSecondaire-xObturateur,epaisseurTole,17]) rotate([-90,0,0]) screwNut(4,10,4.5);
            
            
        }
        
        if (search(15,animation)) {
            render() translate([xMotor,58-0.8,zMotor]) rotate([90,0,0]) 625zz();
            translate([xMotor,58-0.8,zMotor]) rotate([90,0,0]) serflex625zz();
            
            for (xz=[[xMotor,zMotor+8+1.5],
                [xMotor-sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),3.5],
                [xMotor+sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),3.5]]) {
                    x = xz[0];
                    z = xz[1];
                               
                    translate([x,largeurBras,z]) {
                        rotate([-90,0,0]) screwNut(3,10,7.8);
                        translate([0,-2,0]) rotate([90,0,0]) rondelle(3,8,0.8);
                    }
                }
            
        }
        
        if (search(16,animation)) {
            translate([xMotor+1,3.5,zMotor-19.3]) rotate([0,0,-90]) endstop();
            translate([xMotor+5,-5,zMotor+7]) rotate([-90,0,180]) laser216();
            translate([xMotor,-1,zMotor]) rotate([90,0,0]) serflex216();
            
        }

        if (search(17,animation)) {
            translate([xMotor,8,zMotor]) arbre321();        
        }
        
        //Exploded views
        if (search(50,animation)) {
            translate([xCouteauIII,largeurBras+spacer108,zCouteauBrasSecondaire]) rotate([90,0,180]) laser108();
            //translate([xCouteauIII,-epaisseurCouteau-spacer108,zCouteauBrasSecondaire]) rotate([90,0,180]) laser108();      
        }        
    }
}

//brasSecondaire();

module assemblageCouteau3(animation) {
    if (search(19,animation)) {
        laser207();
        translate([6,4,0]) rotate([-90,0,0]) screwNut(4,10,5.7);
    }
    
    if (search(20,animation)) {
        translate([0,-50,0]) laser207();
        translate([6,4+20,0]) rotate([-90,0,0]) screwNut(4,10,5.7+70,true);        
    }    
}

/*module assemblageContreCouteauIII(animation) {
    translate([0,0,0]) rotate([90,0,0]) laser105();
    translate([0,-epaisseurCouteau,0]) rotate([0,90,0]) assemblageCouteau3(animation);    
}*/


//cadreInf();


module cadre(animation=[0,1,2,3]) {
    if (search(0,animation)) {
        profile301();
        translate([longueur,largeur,0]) rotate([0,0,180]) profile301();
    }
    
    if (search(1,animation)) {
        translate([longueur,0,0]) rotate([0,0,90]) profile302();
        translate([0,largeur,0]) rotate([0,0,-90]) profile302();
    }
    
    if (search(2,animation)) {
        laser206();
        translate([longueur,largeur,0]) rotate([0,0,180]) laser206();
        translate([longueur,0,0]) rotate([0,0,90]) laser206();
        translate([0,largeur,0]) rotate([0,0,-90]) laser206();
    }

    if (search(3,animation)) {
        for (x=[26,48,longueur-26,longueur-48],y=[10,largeur-10])
            translate([x,y,0]) rotate([180,0,0]) screwNut(4,10,4);
        for (x=[10,longueur-10],y=[26,48,largeur-26,largeur-48])
            translate([x,y,0]) rotate([180,0,0]) screwNut(4,10,4);
    }
}




module cadreSup(animation=[0,1,2,3,4,5,6]) {
    translate([0,largeur,zPlateau]) rotate([180,0,0]) cadre(animation);
    
    
        
    if (search(4,animation)) {
        translate([longueur-xCouteauSuperieur,eCorniereCadre,zPlateau-epaisseurTole-eCorniereCadre]) rotate([-90,0,0]) laser101();
        translate([longueur-xCouteauSuperieur,largeur-eCorniereCadre-epaisseurCouteau,zPlateau-epaisseurTole-eCorniereCadre]) rotate([-90,0,0]) laser101();

        for (y=[eCorniereCadre+epaisseurCouteau,largeur-eCorniereCadre])
            translate([xCouteauSuperieur,y,zPlateau-epaisseurTole-eCorniereCadre]) rotate([-90,0,180]) laser102();
        
    }
    
        
    if (search(5,animation)) {
        for (x=[xCouteauSuperieur,xCouteauInferieur]) {
            translate([longueur-x,largeur,zPlateau-12])rotate([-90,0,0]) screwNut(4,10,6);
            translate([longueur-x,0,zPlateau-12])rotate([90,0,0]) screwNut(4,10,6);
        }
        
        translate([xCouteauSuperieur,0,zPlateau-12])rotate([90,0,0]) screwNut(4,10,6);
        translate([xCouteauSuperieur,largeur,zPlateau-12])rotate([-90,0,0]) screwNut(4,10,6);
    }
    
    if (search(6,animation)) {
        translate([2,yMediane,zPlateau-2]) protection701();
        
        for (x=[10,longueur-10],y=[y303+2-10,y304-2+10]) {
            translate([x,y,zPlateau])rotate([0,0,0]) screwNut(4,10,2.6+0.8);
            translate([x,y,zPlateau-2.6-0.8]) rondelle(4,10,0.8);
        }
    }
    
}




module cadreInf(animation=[0,1,2,3,4,5,6,7,8,9,10,11]) {

    
    cadre(animation);
    
    
    if (search(4,animation)) {
        translate([2,y304-2,2]) profile303();
        translate([498,y303+2,2]) rotate([0,0,180]) profile304();
    }    
    
    if (search(5,animation)) {
        translate([xBrasSecondaire2,y303,z]) rotate([0,0,0]) rotate([90,0,0]) laser105();
        translate([xBrasSecondaire2,y304,z]) rotate([0,0,180]) rotate([90,0,0]) laser105();
        for (x=[xBrasSecondaire2+8,xBrasSecondaire2-8]){
            translate([x,y303+2,14])rotate([-90,0,0]) screwNut(4,10,6);
            translate([x,y304-2,14])rotate([90,0,0]) screwNut(4,10,6);
        }
    }    
    
    if (search(6,animation)) {
       //obturateur
        translate([xObturateur,y304+4,4]) rotate([90,0,180]) {
            for (x=[-6.5,15.5]) {
                translate([x,9,-6]) rotate([180,0,0]) screwNut(4,16,8);
                translate([x,9,-4]) rondelle(4,8,4);
                //for (z=[0:4]) translate([x,9,-1-z]) rondelle(4,8,1);
                    
            }
                
            laser203();
            translate([0,26.4,epaisseurTole/2]) rotate([-90,180,0]) endstop();
            translate([-9.5,31,1])rotate([-90,30,0]) screwNut(3,12,8.6);
            for (x=[-9.5,9.5],z=[0,0.8]) {
                translate([x,24.8+z,0])rotate([-90,0,0]) rondelle(3,8);
            }
        }
    }   

    if (search(7,animation)) {
        for (x=[10,longueur-10],y=[y303+2-10,y304-2+10])
            translate([x,y,0])rotate([180,0,0]) screwNut(4,10,4);
    }
    

    

    
    if (search(8,animation)) {
        for (y=[eCorniereCadre,largeur-eCorniereCadre-epaisseurCouteau]) {
            translate([xCouteauInferieur,y+epaisseurCouteau,epaisseurTole+eCorniereCadre]) rotate([90,0,0]) laser101();
            translate([longueur-xCouteauInferieur,y,epaisseurTole+eCorniereCadre]) rotate([90,0,180]) laser101();
        }
        
    }
    
    if (search(9,animation)) {
        for (x=[xCouteauInferieur,xCouteauSuperieur,longueur-xCouteauInferieur,longueur-xCouteauSuperieur]){
            translate([x,0,12])rotate([90,0,0]) screwNut(4,10,6);
            translate([x,largeur,12])rotate([-90,0,0]) screwNut(4,10,6);
        }
    }
    
    if (search(10,animation)) {
        translate([x308,largeur-l308309-2,4]) rotate([0,0,90]) profile308();
        translate([x309,largeur-2,4]) rotate([0,0,-90]) profile309();
        
        for (x=[x308-10,x309+10]) {
            translate([x,largeur-l308309-2+8,2]) rotate([180,0,0]) screwNut(4,10,4);
        }
        
        translate([x309+2,largeur-90,6]) cube([100,68,50]);
        
        
    }
        
 
    //if (search(11,animation) || search(20,animation)) {

        
        translate([xBrasSecondaire2,y303,z]) rotate([0,0,0]) translate([0,-epaisseurCouteau,0]) rotate([0,90,0]) assemblageCouteau3(animation);    
        translate([xBrasSecondaire2,y304,z]) rotate([0,0,180]) translate([0,-epaisseurCouteau,0]) rotate([0,90,0]) assemblageCouteau3(animation);    
    //}
}





module assemblageContreCouteau(inversion,animation) {
    rotX = inversion ? -90: 90;
    transZ = ((inversion == 1) ? epaisseurCouteau : 0); //inversion ? -epaisseurCouteau:2*epaisseurCouteau;        
    transY = ((inversion == 0) ? epaisseurCouteau : 0);
    transYCentrage = ((inversion == 0) ? epaisseurCouteau : -epaisseurCouteau);
    transYFixation = ((inversion == 0) ? -epaisseurTole : epaisseurTole);
    rotZ = ((inversion == 0) ? 180 : 0);
    
    
    if (search(0,animation)) {
        translate([-36,transY,-14]) rotate([90,0,0]) laser106();
    }
    
    //if (search(1,animation)) {
        translate([0,transYCentrage,0]) rotate([0,-90,rotZ]) assemblageCouteau3(animation);
        translate([offsetCouteau,transYCentrage,0]) rotate([0,90,rotZ]) assemblageCouteau3(animation);
    //}
    
    if (search(2,animation)) {
        translate([-22,transYFixation,10]) rotate([0,0,rotZ+180]) laser201();
        translate([-22,transYFixation,-10-epaisseurTole]) rotate([0,0,rotZ+180]) laser201();
    }
    
    
    if (search(20,animation)) {
        translate([0,transYCentrage,0]) rotate([0,-90,rotZ]) {
            translate([0,-20,0]) laser207();
            translate([6,4+80,0]) rotate([-90,0,0]) screwNut(4,10,5.7+100,true);
        }
    }
    if (search(21,animation)) {
        translate([offsetCouteau,transYCentrage,0]) rotate([0,90,rotZ]) {
            translate([0,-20,0]) laser207();
            translate([6,4+80,0]) rotate([-90,0,0]) screwNut(4,10,5.7+100,true);
        }
    }    
    //if (search(22,animation)) {
        translate([0,transYCentrage,0]) rotate([0,-90,rotZ]) assemblageCouteau3(animation);
    //}
    //if (search(23,animation)) {
        translate([offsetCouteau,transYCentrage,0]) rotate([0,90,rotZ]) assemblageCouteau3(animation);
    //}    
}



//assemblageTriangle1([0,1,2,3,8,9,10,11]);
module assemblageTriangle1(animation=[0,2,3,4,5,6,7,8,9,10,11,12,19]) {
    
    //contre couteaux
    translate([longueur-xCouteauInferieur, largeur-epaisseurTole, zPlateau/2]) rotate([0,0,180]) assemblageContreCouteau(0,animation);
    translate([longueur-xCouteauInferieur, epaisseurTole, zPlateau/2]) rotate([0,0,180]) assemblageContreCouteau(1,animation);          
    
    
    if (search(3,animation)) {
        translate([longueur-6,0,zPlateau / 2 - 10]) rotate([0,0,90]) tube311();
    }
    
    if (search(4,animation)) {
        translate([longueur/2,y312+10+spacer104+epaisseurCouteau,zPlateau / 2]) rotate([90,0,0]) laser103();

        for (x=[21,-21]) {
            translate([longueur/2+x,y312+10,zPlateau / 2]) rotate([-90,0,0]) rondelle(4,8,spacer104);            
            translate([longueur/2+x,y312+10+4+spacer104,zPlateau / 2]) rotate([-90,0,0]) screwNut(4,30,24+spacer104);
        }        
    }


    if (search(5,animation)) {
        translate([longueur-26,y312-10,zPlateau / 2+10]) rotate([0,180,0]) tube312();
    }


    
    if (search(6,animation)) {
        translate([longueur-xCouteauInferieur+32,y312+10,zPlateau / 2 + 10 + 2]) rotate([180,0,-90]) laser215();
        translate([longueur-xCouteauInferieur+32,y312+10,zPlateau / 2 - 10]) rotate([180,0,-90]) laser215();
    }

    if (search(7,animation)) {    
        translate([longueur-xCouteauInferieur+32-10,y312,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([longueur-xCouteauInferieur+32-30,y312,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([longueur-xCouteauInferieur+32-90,y312,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([longueur-xCouteauInferieur+32-10,y312-40,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
    }
    
    
    if (search(8,animation)) {
        translate([longueur/2,largeur-y312-10-spacer104,zPlateau / 2]) rotate([90,0,0]) laser103();
        
        for (x=[21,-21]) {
            translate([longueur/2+x,largeur-y312-10,zPlateau / 2]) rotate([90,0,0]) rondelle(4,8,spacer104);
            translate([longueur/2+x,largeur-y312-10-4-spacer104,zPlateau / 2]) rotate([90,0,0]) screwNut(4,30,24+spacer104);
        }        
    }    
    if (search(9,animation)) {
        translate([longueur-26,largeur-y312-10,zPlateau / 2+10]) rotate([0,180,0]) tube312();
    }

    if (search(10,animation)) {
        translate([longueur-xCouteauInferieur+32,largeur-y312-10,zPlateau / 2 - 10 -2]) rotate([0,0,90]) laser215();
        translate([longueur-xCouteauInferieur+32,largeur-y312-10,zPlateau / 2 + 10]) rotate([0,0,90]) laser215();
    }

    if (search(11,animation)) {    
        translate([longueur-xCouteauInferieur+32-10,largeur-y312,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([longueur-xCouteauInferieur+32-30,largeur-y312,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([longueur-xCouteauInferieur+32-90,largeur-y312,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([longueur-xCouteauInferieur+32-10,largeur-y312+40,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);        
    }

    if (search(12,animation)) {
        translate([longueur-16, 12, zPlateau/2+12]) screwNut(4,30,24);
        translate([longueur-16, largeur-12, zPlateau/2+12]) screwNut(4,30,24);
    }

}

//assemblageTriangle1();

//assemblageTriangle2([0,1,2,3,4,5,6,7,9,10,11,12,14]);

//4

module assemblageTriangle2(animation=[0,19,2,3,4,5,6,7,8,9,10,11,12,13,14]) {
    zTubeCarre = zPlateau / 2 - 10;
    
    //if (search(0,animation)) {
        //contre couteaux
    translate([xCouteauInferieur,epaisseurTole,zPlateau/2]) assemblageContreCouteau(0,animation);
    translate([xCouteauInferieur,largeur-epaisseurTole,zPlateau/2]) assemblageContreCouteau(1,animation);
    //}
    
    if (search(3,animation)) {
        translate([xCouteauInferieur-12,0,zTubeCarre]) rotate([0,0,90]) tube313();
    }

    if (search(4,animation)) {
        translate([xAppuiLong,y314+10,zTubeCarre+10]) rotate([90,0,90]) laser209();
        translate([xAppuiLong,y314+10,zTubeCarre+10]) rotate([0,0,90]) laser208();
        
        for (x=[10,-10])
            translate([xAppuiLong+x,y314-10,zTubeCarre+11]) rotate([90,0,0]) screwNut(4,25,22);
    }
    
    if (search(5,animation)) {
        translate([26,y314-10,zPlateau / 2-10]) tube314();
    }

    
    if (search(6,animation)) {
        translate([6,y314+10,zPlateau / 2 + 10]) rotate([0,0,-90]) laser215();
        translate([6,y314+10,zPlateau / 2 - 10-2]) rotate([0,0,-90]) laser215();
    }
    
    if (search(7,animation)) {
        translate([6+10,y314,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([6+30,y314,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([6+90,y314,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([6+10,y314-40,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
    }
    

    
    if (search(8,animation)) {
        
        translate([longueur/2,y314-10-spacer104,zPlateau / 2]) rotate([90,0,0]) laser104();
        
        for (x=[8,-8]) {
            translate([longueur/2+x,y314-10,zPlateau / 2-4]) rotate([90,0,0]) rondelle(4,8,spacer104);
            translate([longueur/2+x,y314-10-4-spacer104,zPlateau / 2-4]) rotate([90,0,0]) screwNut(4,30,24+spacer104);       
        }
    }



    if (search(9,animation)) {
        
        translate([xAppuiLong,largeur-y314-10,zTubeCarre+10]) rotate([90,0,-90]) laser209();
        translate([xAppuiLong,largeur-y314-10,zTubeCarre+10]) rotate([0,0,-90]) laser208();
        
        for (x=[10,-10])
            translate([xAppuiLong+x,largeur-y314+10,zTubeCarre+11]) rotate([-90,0,0]) screwNut(4,25,22);        
    }
    
    if (search(10,animation)) {

        translate([26,largeur-y314-10,zPlateau / 2-10]) tube314();
    }

    
    if (search(11,animation)) {
        translate([6,largeur-y314-10,zPlateau / 2 + 10+2]) rotate([180,0,90]) laser215();
        translate([6,largeur-y314-10,zPlateau / 2 - 10]) rotate([180,0,90]) laser215();
    }
    
    if (search(12,animation)) {
        translate([6+10,largeur-y314,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([6+30,largeur-y314,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([6+90,largeur-y314,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([6+10,largeur-y314+40,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);    
    }
    

    
    if (search(13,animation)) {
        translate([longueur/2,largeur-y314+10+spacer104+epaisseurCouteau,zPlateau / 2]) rotate([90,0,0]) laser104();
        
        for (x=[8,-8]) {
            translate([longueur/2+x,largeur-y314+10,zPlateau / 2-4]) rotate([-90,0,0]) rondelle(4,8,spacer104);
            translate([longueur/2+x,largeur-y314+10+4+spacer104,zPlateau / 2-4]) rotate([-90,0,0]) screwNut(4,30,24+spacer104);                
        }
    }
    
    if (search(14,animation)) {
        translate([16, largeur-12, zPlateau/2+12]) screwNut(4,30,24);
        translate([16, 12, zPlateau/2+12]) screwNut(4,30,24);
    }
    
    
    //Exploded views
    if (search(50,animation)) {
        translate([xAppuiLong,y314+10,zTubeCarre+10]) rotate([90,0,90]) laser209();
        translate([xAppuiLong,y314+10,zTubeCarre+10]) rotate([0,0,90]) laser208();
        
    }
    
}



module serflex213() {
    r1 = 19/2;
    r1ext = r1+1;
    
    r2 = 2;
    r2ext = r2+1;
    h = r1-r2+1;
    
    translate([0,0,-1.5]) {
        difference() {
            union() {
                cylinder(r=r1ext,h=3);
                translate([-r1ext+r2ext,h,0]) cylinder(r=r2ext,h=3);
                translate([-r1ext,0,0]) cube([r1ext*2,h,3]);
                translate([-r1ext+r2ext,h,0]) cube([r1ext*2-r2ext,r2ext,3]);
            }
                
            
            translate([0,0,-1]) cylinder(r=r1,h=5);
            translate([-r1+r2,h,-1]) cylinder(r=r2,h=5);
            translate([-r1,0,-1]) cube([r1*2,h,5]);
            translate([-r1+r2,h-1,-1]) cube([2*r1-r2,r2+1,5]);
           
        }
        translate([r1,h+r2-1,-1]) cube([3,3,5]);
        translate([r1,h+r2,0]) cube([5,1,3]);
    }
}



module serflex625zz() {
    
    linear_extrude(5) {
        difference() {
            offset(delta=1) hull() {
                translate([0,0]) circle(d=16);
                for (xz=[[0,0+8+1.5],
                    [0-sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),-zMotor+3.5],
                    [0+sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),-zMotor+3.5]]) {
                    translate(xz) circle(d=3,$fn=32);
                }
                
            }

            hull() {
                translate([0,0]) circle(d=16);
                for (xz=[[0,0+8+1.5],
                    [0-sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),3.5-zMotor],
                    [0+sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),3.5-zMotor]]) {
                    translate(xz) circle(d=3,$fn=32);
                }
            }
            
            //#translate([5.8,6.8]) rotate(43) square([4,4]);
        }
        translate([3.4,8.5]) square([4.5,1]);
    }
    translate([4,7.5,-1]) cube([3,3,7]);
}


module serflex216_0() {
    projection()
    intersection() {
        rotate([-90,0,0]) translate([0,1,0]) {
            translate([1,3.5,0-19.3]) rotate([0,0,-90]) endstop();
            translate([5,-5,0+7]) rotate([-90,0,180]) laser216();
            translate([0,0,0]) rotate([-90,30,0]) motorPulley();
        }
        translate([-50,-50,0]) cube([100,100,1]);
    }
}

module serflex216() {
    linear_extrude(4)
    difference() {
        offset(1) hull() serflex216_0();
        hull() serflex216_0();
    }
}


//serflex216() ;

//assemblageGlobal();
//assemblageTriangle2([0,1]);

/*a = [1,2,3];
function add(v, i = 0, r = 0, lim) = (i < lim) ? add(v, i + 1, r + v[i]) : r;
output = add(a,0,0,3);

echo(output);*/

module assemblageGlobal(animation=64) {
    numSteps = [12,17,15,13,7];
    numStepsCumul = [12,29,44,57,64];
    
    
    if (animation >= 0) {
        for (i=[0:min(animation,numStepsCumul[0]-1)]) 
            cadreInf([i]);
    }
    

    if (animation >= numStepsCumul[0]) {        
        for (i=[0:min(animation,numStepsCumul[1]-1)-numStepsCumul[0]])
            brasSecondaire([i]);
    }

    if (animation >= numStepsCumul[1]) {        
        for (i=[0:min(animation,numStepsCumul[2]-1)-numStepsCumul[1]])
            assemblageTriangle2([i]);
    }
    
    if (animation >= numStepsCumul[2]) {        
        for (i=[0:min(animation,numStepsCumul[3]-1)-numStepsCumul[2]]) 
            assemblageTriangle1([i]);
    }

    if (animation >= numStepsCumul[3]) {        
        for (i=[0:animation-numStepsCumul[3]])
            cadreSup([i]);
    }
}
//cadreSup();

/*
cadreInf();
brasSecondaire();
#cube([60,300,100]);
*/

