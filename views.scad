include <functions.scad>
include <assembly.scad>
include <parameters.scad>
include <timing_belts.scad>

/////////////////////////////////////////////////
/////             Manuel assemblage         /////
/////////////////////////////////////////////////  
//projection() 


module laserParts() {
    translate([0,300,0]) legend("101"); 
    translate([50,300,0]) laser101();

    translate([0,260,0]) legend("102");
    translate([50,250,0]) laser102();

    translate([0,220,0]) legend("103");
    translate([70,230,0]) laser103();

    translate([0,185,0]) legend("104");
    translate([60,195,0]) laser104();

    translate([0,140,0]) legend("105");
    translate([60,160,0]) laser105();

    translate([0,90,0]) legend("106");
    translate([40,80,0]) laser106();

    translate([0,40,0]) legend("108");
    translate([60,40,0]) laser108();


    
    translate([120,300,0]) legend("201");
    translate([180,300,0]) laser201();

    translate([120,260,0]) legend("203");
    translate([170,270,0]) rotate([0,0,-90]) laser203();

    translate([120,200,0]) legend("206");
    translate([170,170,0]) laser206();

    translate([120,140,0]) legend("207");
    translate([185,150,0]) laser207();

    translate([120,90,0]) legend("208");
    translate([170,100,0]) laser208();

    translate([120,50,0]) legend("209");
    translate([170,50,0]) laser209();

    translate([120,10,0]) legend("211");
    translate([170,10,0]) laser211();


    translate([270,300,0]) legend("212");
    translate([320,300,0]) laser212();

    translate([270,260,0]) legend("213");
    translate([330,260,0]) laser213();
    
    translate([270,200,0]) legend("215");
    translate([380,220,0]) rotate([0,0,180]) laser215();
    
    translate([270,100,0]) legend("216");
    translate([340,100,0]) rotate([0,0,-180]) laser216();
    
    //translate([270,50,0]) legend("251");
    //translate([340,60,0]) rotate([0,0,-180]) laser251();

    translate([270,10,0]) legend("252");
    translate([330,15,0]) laser252();
    
    
    translate([430,140,0]) legend("281");
    translate([440,60,0]) rotate([0,0,90]) laser281();
        
        
    translate([430,300,0]) legend("601");
    translate([440,280,0]) rotate([-60,0,0]) rotate([0,0,-45]) printed601();        

    translate([430,240,0]) legend("602");
    translate([440,220,0]) rotate([-60,0,0]) rotate([0,0,-45]) printed602();            
}


module profiles() {
    
    translate([-10,-30,0]) legend("301");
    translate([-10,-50,0]) legend("x4");
    translate([0,0,0]) rotate([-30,0,0]) rotate([0,0,-100]) rotate([30,0,0]) translate([-longueur,0,0]) profile301();
    
    translate([30,-30,0]) legend("302");
    translate([30,-50,0]) legend("x4");
    translate([40,0,0]) rotate([-30,0,0]) rotate([0,0,-100]) rotate([30,0,0]) translate([-largeur,0,0]) profile302();
    
    translate([70,-30,0]) legend("303");
    translate([70,-50,0]) legend("x1");
    translate([80,0,0]) rotate([-30,0,0]) rotate([0,0,-100]) rotate([30,0,0]) translate([-l303304,0,0]) profile303();
    
    translate([110,-30,0]) legend("304");
    translate([110,-50,0]) legend("x1");
    translate([120,0,0]) rotate([-30,0,0]) rotate([0,0,-100]) rotate([30,0,0]) translate([-l303304,0,0]) profile304();
    
    translate([150,-30,0]) legend("308");
    translate([150,-50,0]) legend("x1");
    translate([160,0,0]) rotate([-30,0,0]) rotate([0,0,-100]) rotate([30,0,0]) translate([-l308309,0,0]) profile308();
    
    translate([190,-30,0]) legend("309");
    translate([190,-50,0]) legend("x1");
    translate([200,0,0]) rotate([-30,0,0]) rotate([0,0,-100]) rotate([30,0,0]) translate([-l308309,0,0]) profile309();
    
    translate([245,-30,0]) legend("305");
    translate([245,-50,0]) legend("x1");
    translate([280,0,0]) rotate([-30,0,0]) rotate([0,0,-100]) rotate([120,0,0]) translate([-lBrasSecondaire,-0,0]) profile305();
    
    translate([295,-30,0]) legend("306");
    translate([295,-50,0]) legend("x1");
    translate([330,0,0]) rotate([-30,0,0]) rotate([0,0,-100]) rotate([120,0,0]) translate([-lBrasSecondaire,0,0]) profile306();
    
    
    translate([350,-30,0]) legend("311");
    translate([350,-50,0]) legend("x1");
    translate([380,0,0]) rotate([-30,0,0]) rotate([-30,0,80]) tube311();
    
    translate([390,-30,0]) legend("312");
    translate([390,-50,0]) legend("x2");
    translate([420,0,0]) rotate([-30,0,0]) rotate([-30,0,80]) tube312();
    
    translate([430,-30,0]) legend("313");
    translate([430,-50,0]) legend("x1");
    translate([460,0,0]) rotate([-30,0,0]) rotate([-30,0,80]) tube313();
    
    translate([470,-30,0]) legend("314");
    translate([470,-50,0]) legend("x2");
    translate([500,0,0]) rotate([-30,0,0]) rotate([-30,0,80]) tube314();
    
    
    
}

module legendCircle(n) {
    l = (n > 9) ? -31 : -16;
        
    linear_extrude(1) {
        
        translate([l,-19]) text(str(n),38, "DejaVu Sans Mono", "center","center");
        difference() {
            circle(40);
            circle(35);
        }
    }
}

module legend(t) {
    linear_extrude(1) {
        text(t,12, "DejaVu Sans Mono", "center","center");
    }
}

legendStep = 20;
xLegend = -160;
yLegend = 300;
//assemblyStep13();
module serflexMontage(l1 = 22, h = 20) {
    difference() {
        union() {
            cylinder(d=l1+2,h=3);
            translate([0,h,0]) cylinder(d=l1+2,h=3);
            translate([-(l1+2)/2,0,0]) cube([l1+2,h,3]);
            translate([0,h,0]) cube([(l1+2)/2,(l1+2)/2,3]);
        }
            
        translate([0,0,-1]) cylinder(d=l1,h=5);
        translate([0,h,-1]) cylinder(d=l1,h=5);
        translate([-(l1)/2,0,-1]) cube([l1,h,5]);    
        translate([0,h,-1]) cube([(l1)/2,(l1)/2,5]);
    }
    translate([l1/2,h+(l1/2)-1,-1]) cube([3,3,5]);
    translate([l1/2,h+(l1/2),0]) cube([20,1,3]);
}


module assemblyStep1() {

    translate([xLegend+40,yLegend,0]) legendCircle(1);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("x2");
    translate([xLegend+20,yLegend-50-1*legendStep,0]) legend(" =>");
    translate([xLegend+80,yLegend-50-1*legendStep+5,0]) scale(0.3) legendCircle(3);
    translate([xLegend+20,yLegend-50-2*legendStep,0]) legend(" =>");
    translate([xLegend+80,yLegend-50-2*legendStep+5,0]) scale(0.3) legendCircle(4);
    
    translate([xLegend,yLegend-50-4*legendStep,0]) legend("301 x4");
    translate([xLegend,yLegend-50-5*legendStep,0]) legend("302 x4");
    translate([xLegend,yLegend-50-6*legendStep,0]) legend("206 x8");
    translate([xLegend,yLegend-50-7*legendStep,0]) legend("M4x10 x32");


    render() translate([280,210,0]) rotate([-55,0,0]) rotate([0,0,-25]) {
        rotate([180,0,0]) {
            translate([-200,-200,0]) cadre();
            
            
            translate([50,-80,0]) intersection() {
                translate([50,50,-100]) cylinder(r=100, h=200);
                union() {
                    
                    /*translate([26,10,-18]) cylinder(d=0.4, h = 110);
                    translate([48,10,-18]) cylinder(d=0.4, h = 110);
                    translate([10,26,-18]) cylinder(d=0.4, h = 110);
                    translate([10,48,-18]) cylinder(d=0.4, h = 110);*/
                    
                    translate([26,10,-30]) rotate([180,0,0]) screwNut(4,10,120,true);
                    translate([48,10,-30]) rotate([180,0,0]) screwNut(4,10,120,true);
                    translate([10,26,-30]) rotate([180,0,0]) screwNut(4,10,120,true);
                    translate([10,48,-30]) rotate([180,0,0]) screwNut(4,10,120,true);
                    
                    
                    translate([0,0,0])profile301();
                    translate([0,largeur,15]) rotate([0,0,-90]) profile302();
                    translate([0,0,40]) laser206();    
                }
            }
        }
    }
}


module assemblyStep2() {
    
    translate([xLegend+40,yLegend,0]) legendCircle(2);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("303 x1");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("304 x1");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("105 x2");
    translate([xLegend,yLegend-50-4*legendStep,0]) legend("203 x1");
    translate([xLegend,yLegend-50-5*legendStep,0]) legend("M4x10 x4");
    translate([xLegend,yLegend-50-6*legendStep,0]) legend("M4x16 x2");
    translate([xLegend,yLegend-50-7*legendStep,0]) legend("M3x12 x1");
    translate([xLegend,yLegend-50-8*legendStep,0]) legend("washer 3x8x0.8 inox x2");
    translate([xLegend,yLegend-50-9*legendStep,0]) legend("washer 3x8x0.8 nylon x2");
    translate([xLegend,yLegend-50-10*legendStep,0]) legend("washer 4x10x0.8 x10");
    
    translate([100,265,0]) legend("nylon >");
    translate([100,250,0]) legend("inox >");

    y1 = largeur/2 - largeurBras/2 - 1;
    y2 = largeur/2 + largeurBras/2 + 1;  
  
    
    
    translate([215,140,0]) rotate([-60,0,0]) rotate([0,0,-45]) {
        translate([-200,-200,0]) {
            translate([2,y2-2,2]) profile303();
            translate([xBrasSecondaire2,y2,z]) rotate([0,0,180]) {
                    translate([0,-20,0]) rotate([90,0,0]) laser105();
                    /*translate([0,-epaisseurCouteau,0]) rotate([0,90,0]) {
                            translate([6,-31.8,0]) rotate([90,30,0]) ecrou(5,7,3.2);
                            translate([0,-30,0]) laser207();
                            translate([6,-10,0]) rotate([-90,0,0]) boulonM4(10);
                    }*/
            }
            translate([361,220,14]) rotate([90,0,0]) screwNut(4,10,80,true);
            translate([345,220,14]) rotate([90,0,0]) screwNut(4,10,80,true);
            
            
            //obturateur
            translate([xObturateur,y2+4,4]) rotate([90,0,180]) {
                for (x=[-6.5,15.5]) {
                    translate([x,9,-40]) rotate([180,0,0]) screwNut(4,16,140,true);
                    //translate([x,9,-40]) rotate([0,0,0]) cylinder(d=0.4, h = 140);
                    
                    //translate([x,9,40]) rondelle(4,8,4);
                    for (z=[0:4]) translate([x,9,-1-(z*6)+40]) rondelle(4,8,0.8);
                        
                }
                    
                translate([0,0,60]) {
                    laser203();
                    translate([0,26+20.4,epaisseurTole/2]) rotate([-90,180,0]) endstop();
                    translate([-9.5,31+35,1])rotate([-90,30,0]) screwNut(3,12,8.6+35,true);
                    //translate([-9.5,31+35,1])rotate([90,30,0]) cylinder(d=0.4, h = 44);
                    for (x=[-9.5,9.5],z=[0,0.8]) {
                        translate([x,24.8+(z*6) + 4,0])rotate([-90,0,0]) rondelle(3,8);
                        
                    }
                }
            }

            
            
            /////////////////304
            translate([0,-20,0]) {
                translate([498,y1+2-50,2]) rotate([0,0,180]) profile304();    
                //translate([xBrasSecondaire2,y1-50,z]) rotate([0,0,0]) assemblageContreCouteauIII(); 
                translate([xBrasSecondaire2,y1-50,z]) rotate([0,0,0])  translate([0,0,0]) rotate([90,0,0]) laser105();   
                translate([361,137,14]) rotate([-90,0,0]) screwNut(4,10,6);
                translate([345,137,14]) rotate([-90,0,0]) screwNut(4,10,6);
            }
        }
    }
}


module assemblyStep3() {
    translate([xLegend+40,yLegend,0]) legendCircle(3);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("101 x4");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("308");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("309");
    translate([xLegend,yLegend-50-4*legendStep,0]) legend("M4x10 x14");
    
    translate([xLegend+15,yLegend-50-6*legendStep,0]) legend("!!!!!!");
    translate([xLegend,yLegend-50-8*legendStep,0]) laser101();
    translate([xLegend+30,yLegend-50-8*legendStep,0]) legend("!=");
    translate([xLegend+90,yLegend-50-8*legendStep,0]) rotate([0,180,0]) laser101();


    
    translate([0,180,0]) rotate([-60,0,0]) rotate([0,0,-45]) {    
        cadreInf([0,1,2,3,8]);
        translate([0,0,30]) cadreInf([4,5,6]);
        //translate([0,0,80]) support303304(6);
        
        for (x=[10,longueur-10],y=[y303+2-10,y304-2+10])
            translate([x,y,-40])rotate([180,0,0]) screwNut(4,10,160,true);
        
                
        for (x=[xCouteauInferieur,xCouteauSuperieur,longueur-xCouteauInferieur,longueur-xCouteauSuperieur]){
            translate([x,-30,12])rotate([90,0,0]) screwNut(4,10,70,true);
            translate([x,largeur+30,12])rotate([-90,0,0]) screwNut(4,10,70,true);
        }

        translate([0,0,60]) {
            translate([x308,largeur-l308309-2,4]) rotate([0,0,90]) profile308();
            translate([x309,largeur-2,4]) rotate([0,0,-90]) profile309();
        }
        
        for (x=[x308-10,x309+10]) {
            translate([x,largeur-l308309-2+8,-60]) rotate([180,0,0]) screwNut(4,10,140,true);
        }

        
    }
}


module assemblyStep4() {
    translate([xLegend+40,yLegend,0]) legendCircle(4);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("101 x2");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("102 x2");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("protection");
    translate([xLegend,yLegend-50-4*legendStep,0]) legend("M4x10+regular nut x8");
    translate([xLegend,yLegend-50-5*legendStep,0]) legend("M4x16+nylstop nut x2");
    translate([xLegend,yLegend-50-6*legendStep,0]) legend("washer M4 x4");
    translate([xLegend,yLegend-50-8*legendStep,0]) legend("nylstop nut on 102 side");    
    translate([xLegend,yLegend-50-9*legendStep,0]) legend("do not tighten completely"); 
    translate([xLegend,yLegend-50-10*legendStep,0]) legend("as few slack as possible");
    translate([xLegend,yLegend-50-11*legendStep,0]) legend("but 102 still free to turn");

    translate([370,30,0]) {
        translate([0,210,0]) legend("!!!!!!");
        translate([0,160,0]) laser101();
        translate([30,160,0]) legend("!=");
        translate([90,160,0]) rotate([0,180,0]) laser101();
    }
       
    translate([50,50,0]) rotate([-60,0,0]) rotate([0,0,-20]) {    
        translate([0,largeur,zPlateau]) rotate([180,0,0]) cadre();
        
        translate([longueur-xCouteauSuperieur,eCorniereCadre + 130,zPlateau-epaisseurTole-eCorniereCadre]) rotate([-90,0,0]) laser101();
        
        translate([longueur-xCouteauSuperieur,largeur-eCorniereCadre-epaisseurCouteau -60,zPlateau-epaisseurTole-eCorniereCadre]) rotate([-90,0,0]) laser101();
        
        for (x=[xCouteauSuperieur,xCouteauInferieur]) {
            translate([longueur-x,largeur + 50,zPlateau-12])rotate([-90,0,0]) screwNut(4,10,180,true);  
            translate([longueur-x,-30,zPlateau-12])rotate([90,0,0]) screwNut(4,10,200,true);  
        }
        
        
        translate([xCouteauSuperieur,12-50,zPlateau-12])rotate([90,0,0]) screwNut(4,10,170,true);
        translate([xCouteauSuperieur,largeur-12+50,zPlateau-12])rotate([-90,0,0]) screwNut(4,10,120,true);
        
        
           
        for (y=[eCorniereCadre+epaisseurCouteau+100,largeur-eCorniereCadre-30])
            translate([xCouteauSuperieur,y,zPlateau-epaisseurTole-eCorniereCadre]) rotate([-90,0,180]) laser102();        
        
        
        translate([2,yMediane,zPlateau-2-40]) protection701();
        for (x=[10,longueur-10],y=[y303+2-10,y304-2+10]) {
            translate([x,y,zPlateau+20])rotate([0,0,0]) screwNut(4,10,2.6+110,true);
            translate([x,y,zPlateau-0.8-70]) rondelle(4,10,0.8);
        }
        
    }
}



module assemblyStep5() {
    yLegend = 200;
    translate([xLegend+40,yLegend,0]) legendCircle(5);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("211");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("212");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("213");
    translate([xLegend,yLegend-50-4*legendStep,0]) legend("2x cable tie");
    translate([xLegend,yLegend-50-5*legendStep,0]) legend("M3x12");
    translate([xLegend,yLegend-50-6*legendStep,0]) legend("3x6x0.8 washer");
    
    translate([0,100,0]) rotate([-60,0,0]) rotate([0,0,-45]) {
        /////////////Contrepoids/////////////////
        xContrePoids = longueurCornieres-17-55;
        xContrePoids = 80;
        
        scale(2) {
            intersection() {
                color("blue") translate([xMotor-9,9,zMotor]) belt();      
                cube([120,100,100]);
            }
        
            render(convexity=5) translate([xContrePoids,largeurBras/2,8+25]) rotate([0,90,0]) LM10UU();
            
            translate([xContrePoids,largeurBras/2,15+25]) rotate([0,0,180]) laser213();
            translate([xContrePoids,largeurBras/2-12,6+60]) screwNut(3,10,80,true);
            
            translate([xContrePoids,largeurBras/2-12,10]) rotate([0,0,180]) laser211();
            translate([xContrePoids,largeurBras/2-12,13+15]) rotate([0,0,180]) laser212();
            

            translate([xContrePoids,largeurBras/2-12,12+5]) rondelle(3,6,0.8);
                

            
            translate([xContrePoids-7.5,30,30]) rotate([90,0,90]) serflexMontage();
            translate([xContrePoids+4.5,30,30]) rotate([90,0,90]) serflexMontage();
            
        }    
    }

    translate([350,100,0]) rotate([-60,0,0]) rotate([0,0,-45]) {   
        scale(5) {
            translate([-11,-5.5,0]) rotate([90,0,0]) belt_len(tGT2_2,6,22);
            rotate([0,0,180]) laser211();
        }
    }
}

module assemblyStep6() {    
    yLegend = 200;
    translate([xLegend+40,yLegend,0]) legendCircle(6);
    translate([xLegend+20,yLegend-50-1*legendStep,0]) legend("tensionner");
    
    //-150,0 - 0,100
    translate([0,200,0]) {
        translate([110,10,0]) legend("=");
        translate([270,-70,0]) legend("=");
        
        rotate([-60,0,0]) rotate([0,0,-45]) {    
            brasSecondaire([1,2,3,6,7],false,200);   
        }
    }
    
    
    translate([100,50,0]) rotate([-60,0,0]) rotate([0,0,-45]) {    
        scale(5) {
            translate([-15.7,3,0]) rotate([90,0,0]) belt_len(tGT2_2,6,10);
            translate([-5.4,3,0.2]) rotate([90,-59,0]) belt_len(tGT2_2,6,6.6);
            translate([5.4,3,0.2]) rotate([90,-59,180]) belt_len(tGT2_2,6,6.6);
            translate([5.7,3,0]) rotate([90,0,0]) belt_len(tGT2_2,6,10);
            translate([-0.95,6,6.35]) rotate([90,-22,0]) draw_tooth(tGT2_2,0,6);
            translate([0.95,6,6.35]) rotate([90,22,0]) draw_tooth(tGT2_2,0,6);
            translate([-5.65,6,0.25]) rotate([90,0,0]) cylinder(d=1.7,h=6,$fn=20);
            translate([5.65,6,0.25]) rotate([90,0,0]) cylinder(d=1.7,h=6,$fn=20);
            translate([0,6,4.2]) rotate([90,0,0]) 
                intersection() {
                difference() {
                    cylinder(d=5.1,h=6,$fn=20);
                    translate([0,0,-1]) cylinder(d=4,h=8,$fn=20);
                }
                translate([-5,1,-1]) cube([10,10,10]);
            }
            tensionner();
        }
        
    }
        
    
}

module assemblyStep7() {
    yLegend = 200;
    translate([xLegend+40,yLegend,0]) legendCircle(7);
    translate([xLegend+20,yLegend-50-1*legendStep,0]) legend("281 x2");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("M4x50 x4");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("M4 nut x10");
    

    translate([150,180,0]) rotate([-60,0,0]) rotate([0,0,-45]) {    
        brasSecondaire([1,2,3,6,7,4,5],false);
    }
    
    translate([-100,200,0]) rotate([-60,0,0]) rotate([0,0,-45]) {            
        brasSecondaire([2],false);

        for (x=[-12,12]) {
            for (y=[-12,12]) {
                translate([xContrePoids+x,largeurBras/2+y,75]) screwNut(4,50,200,true);
                translate([xContrePoids+x,largeurBras/2+y,-50]) nut(4);
            }
            translate([xContrePoids+x,largeurBras/2+12,-10]) nut(4);
        }        
       
        translate([xContrePoids,largeurBras/2,-70]) laser281();
        translate([xContrePoids,largeurBras/2,-90]) laser281();
    }
    
    translate([450,150,0]) scale(2) rotate([-90,-90,0]) {    
        brasSecondaire([1,2,3,6,4,5,7],false);
    }
}

module assemblyStep8() {
    translate([xLegend+40,yLegend,0]) legendCircle(8);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("108 x1");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("602 (3d printed)");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("252");
    translate([xLegend,yLegend-50-4*legendStep,0]) legend("motor");
    translate([xLegend,yLegend-50-5*legendStep,0]) legend("pulley");
    translate([xLegend,yLegend-50-6*legendStep,0]) legend("f623zz x2");
    translate([xLegend,yLegend-50-7*legendStep,0]) legend("M4x10 x5");
    translate([xLegend,yLegend-50-8*legendStep,0]) legend("M4 washer x2");
    translate([xLegend,yLegend-50-9*legendStep,0]) legend("M3x20");
    translate([xLegend,yLegend-50-10*legendStep,0]) legend("spacer 3x8x5");


    
    translate([50,200,0]) rotate([-60,0,0]) rotate([0,0,-45]) {     
        profile306();


        //9
        translate([xMotor,-30,zMotor]) rotate([-90,30,0]) translate([0,-8,-19]) stepper28BYJ();
        translate([xMotor+fixMoteur1X,-0.5-60,zMotor+fixMoteur1Y]) rotate([90,0,0]) screwNut(4,10,130,true);
        translate([xMotor-fixMoteur2X,-0.5-60,zMotor+fixMoteur2Y]) rotate([90,0,0]) screwNut(4,10,120,true);
        
        
        translate ([xMotor,-1,zMotor]) translate([0,-40,0]) rotate([-90,0,0]) cylinder(d=0.4, h = 160);
        //translate([xMotor,4+90,zMotor]) rotate([-90,0,180]) laser251();
        translate([xMotor,4+90,zMotor]) rotate([0,90,90]) printed602();
        
        translate([xMotor,110,zMotor]) rotate([-90,30,0]) translate([0,0,3]) pulley();
          
        
        //10
        translate([xCouteauIII,-epaisseurCouteau-spacer108-30,zCouteauBrasSecondaire]) rotate([90,0,180]) laser108();        
        for (x=[xCouteauIII+10,xCouteauIII-20]) {
            translate([x,-4.8-70,zCouteauBrasSecondaire+13]) rotate([90,0,0]) screwNut(4,10,140,true);
            translate([x,-15,zCouteauBrasSecondaire+13]) rotate([90,0,0]) rondelle(4,8,0.8);
        }



        //8
        render() translate([xPulley,90,zMotor]) rotate([90,0,0]) f623zz();
        render() translate([xPulley,70,zMotor]) rotate([-90,0,0]) f623zz();       
        translate([xPulley,-30,zMotor]) rotate([90,0,0]) screwNut(3,20,140,true);
        translate([xPulley,2+50,zMotor]) rotate([-90,0,0]) rondelle(3,8,5);
        
        
        //14            
        translate([longueur-xBrasSecondaire-xObturateur+epaisseurTole/2,-40,5])  rotate([90,0,-90]) laser252();
        translate([longueur-xBrasSecondaire-xObturateur,epaisseurTole+80,17]) rotate([-90,0,0]) screwNut(4,10,4.5+120,true);
        
        
    }
}


//assemblyStep9();
module assemblyStep9() {
    yLegend = 200;
    
    translate([xLegend+40,yLegend,0]) legendCircle(9);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("108");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("625zz");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("cable tie");
    translate([xLegend,yLegend-50-4*legendStep,0]) legend("M4x10 x2");
    translate([xLegend,yLegend-50-5*legendStep,0]) legend("M4 washer x2");
    translate([xLegend,yLegend-50-6*legendStep,0]) legend("M3 washer x3");
    translate([xLegend,yLegend-50-7*legendStep,0]) legend("M3x12 x3");
    

    
    translate([350,50,0]) rotate([-60,0,0]) rotate([0,0,-45]) {   
        rotate([0,0,180]) {
            translate([lBrasSecondaire,largeurBras,0])  rotate([0,0,180]) profile305();
                
            
             //10
            translate([xCouteauIII,largeurBras+spacer108+30,zCouteauBrasSecondaire]) rotate([90,0,180]) laser108();
            for (x=[xCouteauIII+10,xCouteauIII-20]) {
                translate([x,largeurBras+4.8+70,zCouteauBrasSecondaire+13]) rotate([-90,0,0]) screwNut(4,10,140,true);
                translate([x,largeurBras+15,zCouteauBrasSecondaire+13]) rotate([-90,0,0]) rondelle(4,8,0.8);
                
            }
            
            //15
            for (xz=[[xMotor,zMotor+8+1.5],
                [xMotor-sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),3.5],
                [xMotor+sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),3.5]]) {
                    x = xz[0];
                    z = xz[1];
                               
                    translate([x,largeurBras,z]) {
                        translate([0,30,0]) rotate([-90,0,0]) screwNut(3,10,160,true);
                        translate([0,-2-50,0]) rotate([90,0,0]) rondelle(3,8,0.8);
                    }
                }
                
            translate([xMotor,58-110,zMotor]) rotate([90,0,0]) 625zz();
            
            /*translate([xMotor,largeurBras+20,zMotor+8+1.5]) rotate([-90,0,0]) screwNut(3,10,130,true);
            translate([xMotor-sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),largeurBras+20,3.5]) rotate([-90,0,0]) screwNut(3,10,130,true);
            translate([xMotor+sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),largeurBras+20,3.5]) rotate([-90,0,0])  screwNut(3,10,130,true);*/
            
            translate([xMotor,58-75,zMotor]) rotate([90,0,180]) serflexMontage(32,0);
            
        }
    }
    
    translate([300,180,0]) scale(2) intersection() {
        translate([480,-50,0]) 
        rotate([-99.4,0,0]) rotate([0,0,-30.1]) 
        {   
            rotate([0,0,180]) brasSecondaire([13,15]);
        }
        translate([0,0,-100]) cylinder(d=100,h=200);
    }
}




module assemblyStep10() {
    yLegend = 200;
    translate([xLegend+40,yLegend,0]) legendCircle(10);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("10mm shaft");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("SK10 (shaft support) x2");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("M5x12 x2");
    

    
    translate([350,50,0]) rotate([-60,0,0]) rotate([0,0,-45]) rotate([0,0,180]) {      
        brasSecondaire([0,1,2,3,4,5,6,7,8,9,12],false);
        
        translate([23,largeurBras/2-21,28]) rotate([180,0,90]) SK10();
        translate([lBrasSecondaire-14,largeurBras/2-21,28]) rotate([180,0,90]) SK10();    
        
        for (x=[30,lBrasSecondaire-7],y=[-16])
            translate([x,largeurBras/2+y,60]) screwNut(5,12,100,true);
    }
}


module assemblyStep11() {
    yLegend = 200;
    translate([xLegend+40,yLegend,0]) legendCircle(11);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("M5x12 x2");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("5mm shaft");
    

    
    translate([420,85,0]) rotate([-60,0,0]) rotate([0,0,-45]) rotate([0,0,180]) {      
        brasSecondaire([0,1,2,3,4,5,6,7,8,9,12],false);
        
        translate([23,largeurBras/2-21,28]) rotate([180,0,90]) SK10();
        translate([lBrasSecondaire-14,largeurBras/2-21,28]) rotate([180,0,90]) SK10();    
        
        for (x=[30,lBrasSecondaire-7],y=[-16])
            translate([x,largeurBras/2+y,30]) screwNut(5,12,8,false);
        
        
        translate([0,100,30]) {
            brasSecondaire([13,15],false);
        }
        
        translate([xMotor,8+30,zMotor]) arbre321();
        translate([xMotor,0,zMotor]) rotate([-90,0,0]) cylinder(d=0.4, h = 100);
        translate([xMotor,100,zMotor]) rotate([0,0,0]) cylinder(d=0.4, h = 30);
        translate([xMotor,100,zMotor+30]) rotate([-90,0,0]) cylinder(d=0.4, h = 60);
        
        
        for (x=[30,lBrasSecondaire-7],y=[16]) {
            translate([x,largeurBras/2+y,100]) screwNut(5,12,180,false);
            translate([x,largeurBras/2+y,100]) rotate([180,0,0]) cylinder(d=0.4, h = 30);
            translate([x,largeurBras/2+y,100-30]) rotate([-90,0,0]) cylinder(d=0.4, h = 100);
            translate([x,largeurBras/2+y+100,100-30]) rotate([180,0,0]) cylinder(d=0.4, h = 30);
            translate([x,largeurBras/2+y,100-30-30]) rotate([-90,0,0]) cylinder(d=0.4, h = 100);
            translate([x,largeurBras/2+y,100-30-30]) rotate([180,0,0]) cylinder(d=0.4, h = 180-60);
        }
        
    }
}

module assemblyStep12() {
    yLegend = 200;
    translate([xLegend+40,yLegend,0]) legendCircle(12);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("216");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("endstop");  
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("cable tie");  
    
    
    translate([200,200,0]) rotate([-87.9,0,0]) rotate([0,0,-253.4]) { 
        brasSecondaire([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,17],false);
        
        translate([xMotor+5,-5-50,zMotor+7]) rotate([-90,0,180]) laser216();
        translate([xMotor+1,3.5,zMotor-19.3-30]) rotate([0,0,-90]) endstop();
        
        
        translate([xMotor,-6,-40]) rotate([0,0,0]) cylinder(d=0.4, h = 15);
        translate([xMotor,-6,-25]) rotate([90,0,0]) cylinder(d=0.4, h = 50);
        translate([xMotor,-6-50,-25]) rotate([0,0,0]) cylinder(d=0.4, h = 15);
        translate([xMotor,-5,zMotor-12]) rotate([-90,180,0]) serflexMontage(80,0);
    }
    
    translate([100,50,0]) rotate([-89.6,0,0]) rotate([0,0,-109.9+180]) scale(2) intersection() {
        brasSecondaire([12,16,9],false);
        translate([-20,-50,-20]) cube([200,100,100]);
    }
    
}

module assemblyStep13() {
    yLegend = 300;
    translate([xLegend+40,yLegend,0]) legendCircle(13);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("207 x2");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("M4x10 x2");  
     
    translate([20,190,0]) rotate([-60,0,0]) rotate([0,0,-45]) {              
        cadreInf([0,1,2,3,4,5,6,7,8,9,10,20]);
        brasSecondaire();
    }
   
    
    translate([-50,172,0]) 
    intersection() {
        rotate([-66.5,0,0]) rotate([0,0,-100.8]) {        
            cadreInf([0,1,2,3,4,5,6,7,8,9,10,20]);
            brasSecondaire([10]);
        }
        translate([30,-170,100]) cube([250,100,500]);
    }
    
}

module assemblyStep14() {
    translate([xLegend+40,yLegend,0]) legendCircle(14);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("loosen 4x M5");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("check alignment between");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("beam and bottom frame");
    translate([xLegend,yLegend-50-4*legendStep,0]) legend("tighten 4x M5");
    
    
    
    
    //translate([0,190,0]) rotate([-60,0,0]) rotate([0,0,-45])
    translate([500,10,0]) 
    rotate([-45,0,0]) rotate([0,0,-270])
    {      
        
        cadreInf([0,1,2,3,4,5,6,7,8,9,10]);
        brasSecondaire();
            
    }
    
    translate([200,90,0]) scale(2) legend("<");
    translate([350,90,0]) scale(2) legend(">");
    
}

module assemblyStep15() {
    translate([xLegend+40,yLegend,0]) legendCircle(15);
    
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("check shutter is centered");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("between endstop fork");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("bend shutter if necessary");
    
    
    translate([150,0,0]) 
    scale(3) render() intersection() {
        translate([150,50,0]) rotate([-83,0,0]) rotate([0,0,-180])
        {   
            brasSecondaire([12,14]);
            cadreInf([4,6]);
        }
        cube([150,200,300]);
    }
}



module assemblyStep16() {
    
    translate([xLegend+40,yLegend,0]) legendCircle(16);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("311");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("312");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("103");
    translate([xLegend,yLegend-50-4*legendStep,0]) legend("106 x2");
    translate([xLegend,yLegend-50-5*legendStep,0]) legend("201 x4");
    translate([xLegend,yLegend-50-6*legendStep,0]) legend("215 x2");
    translate([xLegend,yLegend-50-7*legendStep,0]) legend("M4x30 x8");
    translate([xLegend,yLegend-50-8*legendStep,0]) legend("washer M4 x10");
    
    
    
    translate([-200,260,0]) rotate([-60,0,0]) rotate([0,0,-45]) {      
        translate([longueur-xCouteauInferieur, epaisseurTole-100, zPlateau/2]) rotate([0,0,180]) {
            translate([-36,0,-14]) rotate([90,0,0]) laser106();
            translate([-22,epaisseurTole,10]) rotate([0,0,0+180]) laser201();
            translate([-22,epaisseurTole,-10-epaisseurTole+8]) rotate([0,0,0+180]) laser201();
            
            
        }
        
        assemblageTriangle1([0,2,3,5]);
        
        //4
        translate([longueur/2,y312+10+spacer104+epaisseurCouteau+60,zPlateau / 2]) rotate([90,0,0]) laser103();

        for (x=[21,-21]) {
            for (n=[1:spacer104N])  translate([longueur/2+x,y312+10 + n * 8 + 12,zPlateau / 2]) rotate([-90,0,0]) rondelle(4,8,spacer104Thick);            //rondelle(4,8,spacer104);            
            
            translate([longueur/2+x,y312+10+4+spacer104+100,zPlateau / 2]) rotate([-90,0,0]) screwNut(4,30,24+spacer104+130,true);
        }    
       

        //6 
        translate([longueur-xCouteauInferieur+32,y312+10,zPlateau / 2 + 10 + 2 + 50]) rotate([180,0,-90]) laser215();
        translate([longueur-xCouteauInferieur+32,y312+10,zPlateau / 2 - 10 - 30]) rotate([180,0,-90]) laser215();


        //7
        translate([longueur-xCouteauInferieur+32-10,y312,zPlateau / 2 +12 + 90]) rotate([0,0,0]) screwNut(4,30,24+180,true);
        translate([longueur-xCouteauInferieur+32-30,y312,zPlateau / 2 +12 + 90]) rotate([0,0,0]) screwNut(4,30,24+180,true);
        translate([longueur-xCouteauInferieur+32-90,y312,zPlateau / 2 +12 + 90]) rotate([0,0,0]) screwNut(4,30,24+180,true);
        translate([longueur-xCouteauInferieur+32-10,y312-40,zPlateau / 2 +12 + 90]) rotate([0,0,0]) screwNut(4,30,24+180,true);
        
        //12
        translate([longueur-16, 12, zPlateau/2+12+40]) screwNut(4,30,24+70,true);
        translate([longueur-16, largeur-12, zPlateau/2+12+40]) screwNut(4,30,24+70,true);
    }
    
    
    
    
    translate([300,105,0]) scale(0.8) legend("control");
    translate([300,90,0]) scale(0.8) legend("right-angle");
    translate([438,62,0]) linear_extrude(1) 
    intersection() {
        translate([-100,0]) square([100,100]);
        difference() {
            circle(d=100);
            circle(d=98);
        }
    }
    translate([250,10,0]) scale(0.4) assemblageTriangle1([0,2,3,4,5,6,7,12]);
    
}





module assemblyStep17() {
    
    translate([xLegend+40,yLegend,0]) legendCircle(17);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("313");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("314");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("104");
    translate([xLegend,yLegend-50-4*legendStep,0]) legend("106 x2");
    translate([xLegend,yLegend-50-5*legendStep,0]) legend("201 x4");
    translate([xLegend,yLegend-50-6*legendStep,0]) legend("208");
    translate([xLegend,yLegend-50-7*legendStep,0]) legend("209");
    translate([xLegend,yLegend-50-8*legendStep,0]) legend("215 x2");
    translate([xLegend,yLegend-50-9*legendStep,0]) legend("M4x30 x8");
    translate([xLegend,yLegend-50-10*legendStep,0]) legend("M4x25 x2");
    translate([xLegend,yLegend-50-11*legendStep,0]) legend("washer M4 x10");
    
    
    
    translate([0,90,0]) rotate([-60,0,0]) rotate([0,0,-45]) {      
        
        
        assemblageTriangle2([0,2,3,5]);
        zTubeCarre = zPlateau / 2 - 10;
        //4
        translate([xAppuiLong,y314+10+30,zTubeCarre+10]) rotate([90,0,90]) laser209();
        translate([xAppuiLong,y314+10+60,zTubeCarre+10]) rotate([0,0,90]) laser208();
        
        for (x=[10,-10])
            translate([xAppuiLong+x,y314-10-30,zTubeCarre+11]) rotate([90,0,0]) screwNut(4,25,22+90,true);
        
        
        //6 
        translate([6,y314+10,zPlateau / 2 + 10+50]) rotate([0,0,-90]) laser215();
        translate([6,y314+10,zPlateau / 2 - 10-2-30]) rotate([0,0,-90]) laser215();

        //7
        translate([6+10,y314,zPlateau / 2 +12+90]) rotate([0,0,0]) screwNut(4,30,24+180,true);
        translate([6+30,y314,zPlateau / 2 +12+90]) rotate([0,0,0]) screwNut(4,30,24+180,true);
        translate([6+90,y314,zPlateau / 2 +12+90]) rotate([0,0,0]) screwNut(4,30,24+180,true);
        translate([6+10,y314-40,zPlateau / 2 +12+90]) rotate([0,0,0]) screwNut(4,30,24+180,true);
        
        
        //8
        translate([longueur/2,y314-10-spacer104-60,zPlateau / 2]) rotate([90,0,0]) laser104();
        
        for (x=[8,-8]) {
            for (n=[1:spacer104N]) translate([longueur/2+x,y314-20 - n * 8,zPlateau / 2-4]) rotate([90,0,0]) rondelle(4,8,spacer104Thick);
                
            translate([longueur/2+x,y314-10-4-spacer104-100,zPlateau / 2-4]) rotate([90,0,0]) screwNut(4,30,24+spacer104+140,true);   
        }
        
        //14
        translate([16, largeur-12, zPlateau/2+12+40]) screwNut(4,30,24+70,true);
        translate([16, 12, zPlateau/2+12+40]) screwNut(4,30,24+70,true);
            
        
        
        //12
    }
    
    
    
    
    translate([500,215,0]) scale(0.8) legend("control");
    translate([500,200,0]) scale(0.8) legend("right-angle");
    translate([462,165,0]) linear_extrude(1) 
    intersection() {
        translate([0,0]) square([100,100]);
        difference() {
            circle(d=100);
            circle(d=98);
        }
    }
    translate([450,100,0]) scale(0.4) assemblageTriangle2([0,2,3,4,5,6,7,8,14]);
    
    
    
    translate([250,140,0]) scale(0.8) legend("asymmetry!");
    render() translate([260,150,0]) intersection() {
        translate([-205,5,25]) rotate([-90,0,0]) tube314();
        cube([40,40,30]);
    }
}


module assemblyStep18() {
    
    translate([xLegend+40,yLegend,0]) legendCircle(18);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("207 x4");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("M4x10 x4");  
    
    
    
    translate([0,190,0]) rotate([-60,0,0]) rotate([0,0,-45]) {      
        
        cadreInf([0,1,2,3,4,5,6,7,8,9,10]);
        brasSecondaire();
        assemblageTriangle2([0,2,3,4,5,6,7,8,14]);
        assemblageTriangle1([0,2,3,4,5,6,7,12]);

        
        translate([longueur-xCouteauInferieur, largeur-epaisseurTole, zPlateau/2]) rotate([0,0,180]) assemblageContreCouteau(0,[20]);
        translate([longueur-xCouteauInferieur, epaisseurTole, zPlateau/2]) rotate([0,0,180]) assemblageContreCouteau(1,[20]);    
        
        
        translate([xCouteauInferieur,epaisseurTole,zPlateau/2]) assemblageContreCouteau(0,[20]);
        translate([xCouteauInferieur,largeur-epaisseurTole,zPlateau/2]) assemblageContreCouteau(1,[20]);
        
        
    }

    translate([550,350,0]) {
        linear_extrude(1) {
            difference() {
                circle(70);
                circle(67);
            }
        }   
        
        scale(2) 
        {

            laser103();
            laser104();
        }
    }
    
    translate([100,70,0]) {
        scale(2) 
        rotate([-90,0,0]) rotate([0,0,238])
        translate([-longueur+xCouteauIII+xBrasSecondaire,-largeur/2+30,-zPlateau/2]) 
        {        
            brasSecondaire([50]);
            assemblageTriangle2([50]);
        }    
        linear_extrude(1) {
            translate([-30,5,0]) difference() {
                circle(65);
                circle(62);
            }
        }   
    }
}




module assemblyStep19() {
    
    translate([xLegend+40,yLegend,0]) legendCircle(19);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("312");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("314");
    translate([xLegend,yLegend-50-3*legendStep,0]) legend("103");
    translate([xLegend,yLegend-50-4*legendStep,0]) legend("104");
    translate([xLegend,yLegend-50-5*legendStep,0]) legend("208");
    translate([xLegend,yLegend-50-6*legendStep,0]) legend("209");
    translate([xLegend,yLegend-50-7*legendStep,0]) legend("215 x4");
    translate([xLegend,yLegend-50-8*legendStep,0]) legend("M4x30 x8");
    translate([xLegend,yLegend-50-9*legendStep,0]) legend("M4x25 x2");
    translate([xLegend,yLegend-50-10*legendStep,0]) legend("washer M4 x20");
    
    
    
    translate([-50,150,0]) rotate([-60,0,0]) rotate([0,0,-45]) {      
        zTubeCarre = zPlateau / 2 - 10;
        
        translate([-100,0,0]) {
            //8
            translate([longueur/2,largeur-y312-10-spacer104-60,zPlateau / 2]) rotate([90,0,0]) laser103();
            
            for (x=[21,-21]) {
                for (n=[1:spacer104N])  translate([longueur/2+x,largeur-y312-10 - n * 8 - 12,zPlateau / 2]) rotate([-90,0,0]) rondelle(4,8,spacer104Thick); 
                
                translate([longueur/2+x,largeur-y312-10-4-spacer104-100,zPlateau / 2]) rotate([90,0,0]) screwNut(4,30,24+spacer104+130,true);
            }      
            //9
            translate([longueur-26,largeur-y312-10,zPlateau / 2+10]) rotate([0,180,0]) tube312();

            //10
            translate([longueur-xCouteauInferieur+32,largeur-y312-10,zPlateau / 2 - 10 -2-10]) rotate([0,0,90]) laser215();
            translate([longueur-xCouteauInferieur+32,largeur-y312-10,zPlateau / 2 + 10+10]) rotate([0,0,90]) laser215();


            //11
            //translate([longueur-xCouteauInferieur+32-10,largeur-y312,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
            translate([longueur-xCouteauInferieur+32-30,largeur-y312,zPlateau / 2 +12+50]) rotate([0,0,0]) screwNut(4,30,24+80,true);
            translate([longueur-xCouteauInferieur+32-90,largeur-y312,zPlateau / 2 +12+50]) rotate([0,0,0]) screwNut(4,30,24+80,true);
            //translate([longueur-xCouteauInferieur+32-10,largeur-y312+40,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);        
        }




        translate([0,-200,0]) {


            //9
            translate([xAppuiLong,largeur-y314-10-30,zTubeCarre+10]) rotate([90,0,-90]) laser209();
            translate([xAppuiLong,largeur-y314-10-60,zTubeCarre+10]) rotate([0,0,-90]) laser208();
            
            for (x=[10,-10])
                translate([xAppuiLong+x,largeur-y314+10+40,zTubeCarre+11]) rotate([-90,0,0]) screwNut(4,25,22+100,true);

            
            //10
            translate([26,largeur-y314-10,zPlateau / 2-10]) tube314();
        
            //11
            translate([6,largeur-y314-10,zPlateau / 2 + 10+2+10]) rotate([180,0,90]) laser215();
            translate([6,largeur-y314-10,zPlateau / 2 - 10-10]) rotate([180,0,90]) laser215();
        
        
            //12
            translate([6+30,largeur-y314,zPlateau / 2 +12+60]) rotate([0,0,0]) screwNut(4,30,24+80,true);
            translate([6+90,largeur-y314,zPlateau / 2 +12+60]) rotate([0,0,0]) screwNut(4,30,24+80,true);
            
            //13
            translate([longueur/2,largeur-y314+10+spacer104+epaisseurCouteau+70,zPlateau / 2]) rotate([90,0,0]) laser104();
        
        for (x=[8,-8]) {
            for (n=[1:spacer104N]) translate([longueur/2+x,largeur-y314+10+20+n * 8,zPlateau / 2-4]) rotate([90,0,0]) rondelle(4,8,spacer104Thick);
            
            translate([longueur/2+x,largeur-y314+10+4+spacer104+120,zPlateau / 2-4]) rotate([-90,0,0]) screwNut(4,30,24+spacer104+150,true);                
        }
        }
    }
}



module assemblyStep20() {
    translate([xLegend+40,yLegend,0]) legendCircle(20);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("M4x30 x4");
  
    
    translate([660,160,0]) rotate([-60,0,0]) rotate([0,0,-45]) rotate([0,0,180]){    
        cadreInf([0,1,2,3,4,5,6,7,8,9,,10,11]);
        brasSecondaire();
        assemblageTriangle1([0,1,2,3,4,5,6,7,12]);
        assemblageTriangle2([0,1,2,3,4,5,6,7,8,14]);
        
        
        
        assemblageTriangle1([8,9,10]);
        //11
        translate([longueur-xCouteauInferieur+32-10,largeur-y312,zPlateau / 2 +12+40]) rotate([0,0,0]) screwNut(4,30,24+65,true);
        translate([longueur-xCouteauInferieur+32-30,largeur-y312,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([longueur-xCouteauInferieur+32-90,largeur-y312,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([longueur-xCouteauInferieur+32-10,largeur-y312+40,zPlateau / 2 +12+40]) rotate([0,0,0]) screwNut(4,30,24+65,true);         
        
        assemblageTriangle2([9,10,11,13]);
        translate([6+30,largeur-y314,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([6+90,largeur-y314,zPlateau / 2 +12]) rotate([0,0,0]) screwNut(4,30,24);
        translate([6+10,largeur-y314+40,zPlateau / 2 +12+40]) rotate([0,0,0]) screwNut(4,30,24+55,true);
        translate([6+10,largeur-y314,zPlateau / 2 +12+40]) rotate([0,0,0]) screwNut(4,30,24+55,true);
    }
}


module assemblyStep21() {
    translate([xLegend+40,yLegend,0]) legendCircle(21);
    translate([xLegend,yLegend-50-1*legendStep,0]) legend("207 x4");
    translate([xLegend,yLegend-50-2*legendStep,0]) legend("M4x10 x4");  
    
  
    
    translate([660,160,0]) rotate([-60,0,0]) rotate([0,0,-45]) rotate([0,0,180]){    
        cadreInf([0,1,2,3,4,5,6,7,8,9,10,11]);
        brasSecondaire();
        assemblageTriangle1([0,2,3,4,5,6,7,8,9,10,11,12,21,22]);
        assemblageTriangle2([0,2,3,4,5,6,7,8,9,10,11,12,13,14,21,22]);
        
        cadreSup([0,1,2,3,4,5,6,7,8,9,11]);
        
    }
}



//assemblyStep1();
//assemblyStep2();
//assemblyStep3();
//assemblyStep4();
//assemblyStep5(); 
//assemblyStep6(); 
//assemblyStep7();
//assemblyStep8();
//asemblyStep9();
//assemblyStep10();

//assemblyStep11();
//assemblyStep11_5();

//assemblyStep12();
//assemblyStep12_5();
//assemblyStep14();
//assemblyStep14();

//assemblyStep15();
//assemblyStep16();
//assemblyStep17();
//assemblyStep18();


//translate([0,-500,0]) projection() laserParts();
//projection() laserParts();

module assembly(s=1) {
    if (s==1) assemblyStep1();
    if (s==2) assemblyStep2();
    if (s==3) assemblyStep3();
    if (s==4) assemblyStep4();
    if (s==5) assemblyStep5();
    if (s==6) assemblyStep6();
    if (s==7) assemblyStep7();
    if (s==8) assemblyStep8();
    if (s==9) assemblyStep9();
    if (s==10) assemblyStep10();
    if (s==11) assemblyStep11();
    if (s==12) assemblyStep12();
    if (s==13) assemblyStep13();
    if (s==14) assemblyStep14();
    if (s==15) assemblyStep15();
    if (s==16) assemblyStep16();
    if (s==17) assemblyStep17();
    if (s==18) assemblyStep18();
    if (s==19) assemblyStep19();
    if (s==20) assemblyStep20();
    if (s==21) assemblyStep21();
}


assembly(step);    
    
/////////////////////////////////////////////
/// Animations 
/////////////////////////////////////////////


//assemblageGlobal(round(($t*43)));

//assemblageGlobal(animationStep);

/*for (i = [0:13]) {
    translate([(13-i)*500,0,0]) rotate([-60,0,0]) rotate([0,0,-160]) brasSecondaireAnimation(i);
}*/

//animationStep = 44;
//animationStep2 = 13 - animationStep;



