include <customParts.scad>


/////////////////////////////////////////////////
/////             Perçages  CNC       /////
/////////////////////////////////////////////////    
module baseCNC() {
     color("red",0.3) render(convexity=2) translate([0,0,-20]) tubeCarre(20,220,2);
    //cube([220,20,20]); 
    #translate([-2,-5,-20]) cube([2,30,25]);
}

module trou(x,y) {
    //color("blue")
    #translate([x,y,-20]) cylinder(r=2,h=30);
    echo(str("G0 X" , x, " Y",y));
}

module percage1001() {
    echo(";1001, sur les pièces 301 et 302");
    baseCNC();
    render() translate([500,-2,2]) rotate([0,180,0]) profile301();
    trou(26,8);
    trou(48,8);
}

module percage1002() {
    echo(";1002, sur les pièces 301 et 302");
    baseCNC();
    render() translate([0,22,2]) rotate([180,0,0]) profile301();
    trou(26,12);
    trou(48,12);
}

module percage1003() {
    echo(";1003, uniquement sur les pièces 301 (et pas 302)");
    baseCNC();
    //translate([0,-2,2]) rotate([-90,0,0]) cadre();
    render() translate([0,-2,2]) rotate([-90,0,0]) profile301();
    trou(38,10);
    trou(58,10);
}

module percage1003bis() {
    baseCNC();
    //translate([0,-2,2]) rotate([-90,0,0]) cadre();
    render() translate([500,22,2]) rotate([90,180,0]) profile301();
    trou(38,10);
    trou(58,10);
}

module percage1004() {
    echo(";1004, sur pièce 303");
    baseCNC();
    //translate([0,-2,2]) rotate([-90,0,0]) cadre();
    //render() 
    //translate([0,22,2]) rotate([180,0,0]) profile303();
    render() translate([496,-2,2]) rotate([180,0,180]) profile303();
    trou(10,10);
}

module percage1004bis() {
     baseCNC();
    render() translate([0,22,2]) rotate([180,0,0]) profile303();
    trou(10,10);
}



module percage1005() {
    echo(";1005, sur pièce 303");
    baseCNC();
    //translate([0,-2,2]) rotate([-90,0,0]) cadre();
    //render() 
    //translate([0,22,2]) rotate([180,0,0]) profile303();
    render() translate([496,22,2]) rotate([-90,0,180]) profile303();
    
    trou(498-xBrasSecondaire2-8,10);
    trou(498-xBrasSecondaire2+8,10);
}


module percage1005bis() {
    baseCNC();
    //translate([0,-2,2]) rotate([-90,0,0]) cadre();
    //render() 
    //translate([0,22,2]) rotate([180,0,0]) profile303();
    render() translate([0,-2,2]) rotate([-90,0,0]) profile307();
    
    trou(498-xBrasSecondaire2-8,10);
    trou(498-xBrasSecondaire2+8,10);
}


module percage1006() {
    echo(";1006, sur pièce 302");
    baseCNC();

    render() translate([430,-2,2]) rotate([0,180,0]) profile302();
    trou(174,10);
}

module percage1006bis() {
    baseCNC();

    render() translate([0,22,2]) rotate([0,180,180]) profile302();
    trou(174,10);
}



module percage1007() {
    baseCNC();
    //translate([0,-2,2]) rotate([-90,0,0]) cadre();
    render() translate([0,-2,2]) rotate([-90,0,0]) profile303();
    
    trou(58,9);
}



module percage1010() {
    echo(";1010, sur pièce 312");
    baseCNC();
    render() translate([0,0,-35]) rotate([90,0,0]) tube312();
    trou(11,-10);
    trou(41,-10);
    trou(71,-10);
}

module percage1011() {
    echo(";1011, sur pièce 312");
    x1 = l312 - (longueur/2 - 26) + 21;
    x2 = l312 - (longueur/2 - 26) - 21;
    baseCNC();
    
    render() translate([l312,-20,-35]) rotate([90,0,180]) tube312();
    
    trou(x1,-10);
    trou(x2,-10);
    
}

module percage1012() { 
    echo(";1012, sur pièce 314");
    baseCNC();
    
    render() translate([l314,-20,-35]) rotate([90,0,180]) tube314();
    
    trou(13,-9);
    trou(33,-9);    
}

module percage1013() {
    echo(";1013, sur pièce 314");
    baseCNC();
    
    render() translate([l314,0,-15]) rotate([-90,0,180]) tube314();
    //render() translate([0,-20,-35]) tubeCarre(20,370,2);
    
    // pour visu, à ne pas mettre en gcode
    trou(138,-6);
    trou(154,-6);
    
    
    trou(13,-11);
    trou(33,-11);
}


module percage1015() {
    echo(";1015, sur pièce 311");
    baseCNC();
    
    render() translate([0,-20,-35]) tube311();
    trou(12,-10);
    trou(y312,-10);
}


module percage1016() {
    echo(";1016, sur pièce 313");
    baseCNC();
    
    render() translate([0,-20,-35]) tube313();
    trou(12,-10);
    trou(y314,-10);
}

module percage1017() {
    echo(";1017, sur pièce 311 et 313");
    baseCNC();
    
    render() translate([largeur,-0,-35]) rotate([0,0,180]) tube311();
    trou(12,-10);
}


module percage1020() {
    echo(";1020, sur pièce 305");
    baseCNC();
    
    translate([0,-2,-28])  profile305();
    trou(7,12);
}

module percage1021() {
    echo(";1021, sur pièce 305");
    baseCNC();
    
    translate([lBrasSecondaire,22,-28]) rotate([0,0,180]) profile305();
    trou(7,8);
}

module percage1022() {
    echo(";1022, sur pièce 306");
    baseCNC();
    
    translate([lBrasSecondaire,28,2]) rotate([-90,0,180]) profile306();

    
    //9 , 21
    trou(lBrasSecondaire-xPulley,28-zMotor);
}

module percage1023() {
    echo(";1023, sur pièce 306");
    xt = 35 / 2;
    yt = 8;
    xt1 = xt * cos(30) - yt * sin(30);
    yt1 = xt * sin(30) + yt * cos(30);
    xt2 = -xt * cos(30) - yt * sin(30);
    yt2 = -xt * sin(30) + yt * cos(30);

    baseCNC();
    
    translate([0,-8,2]) rotate([-90,0,0]) profile306();
    
    trou(xMotor,-8+zMotor);
    trou(xMotor-xt1,-8+zMotor+yt1);
    trou(xMotor-xt2,-8+zMotor+yt2);        
        
    trou(xCouteauIII-10,-8+zCouteauBrasSecondaire+17);        
    trou(xCouteauIII+10,-8+zCouteauBrasSecondaire+17);        
}

module percage1024() {
    echo(";1024, sur pièce 305");
    baseCNC();
    
    translate([lBrasSecondaire,28,2]) rotate([-90,0,180]) profile305();

    trou(xCouteauIII-20,28-zCouteauBrasSecondaire-13);        
    trou(xCouteauIII+10,28-zCouteauBrasSecondaire-13);        
}

module percage100x() {
    s = -50;
    percage1001();
    translate([0,1*s,0]) percage1002();
    translate([0,2*s,0]) percage1003();
    translate([0,3*s,0]) percage1003bis();
    translate([0,4*s,0]) percage1004();
    translate([0,5*s,0]) percage1004bis();
    translate([0,6*s,0]) percage1005();
    translate([0,7*s,0]) percage1005bis();
    translate([0,8*s,0]) percage1006();
    translate([0,9*s,0]) percage1006bis();
    translate([0,10*s,0]) percage1007();
}


module percage101x() {
    s = -70;
    translate([0,0*s,0]) percage1010();
    translate([0,1*s,0]) percage1011();
    translate([0,2*s,0]) percage1012(); 
    translate([0,3*s,0]) percage1013();
    translate([0,4*s,0]) percage1015();
    translate([0,5*s,0]) percage1016();
    translate([0,6*s,0]) percage1017();
}

module percage102x() {
    s = -70;
    translate([0,0*s,0]) percage1020();
    translate([0,1*s,0]) percage1021();
    translate([0,2*s,0]) percage1022();
    translate([0,3*s,0]) percage1023();
    translate([0,4*s,0]) percage1024();
}

percage101x();