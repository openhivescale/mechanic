include <customParts.scad>
fnLocal = 60;

module trou(x,y,d=4) {
    echo(str(x, "   ",y));
    translate([x,y,-30]) cylinder(d=d,$fn=fnLocal,h=80);    
}

module percageOutil1000() {
    trou(0,0);    
    
    //1001-1004, 1009-1010, 1015-1016
    for (x=[-160,-100,-28,28,100,160]) {
        trou(x,12);    
    }
    
    //1001-1004
    for (x=[-10,-30,10,30]) {
        trou(x,-12);    
    }
    
    //1001-1004
    for (x=[-26,-48,26,48]) {
        trou(x-((10-sqrt(2))*(x/abs(x))),sqrt(2));    
    }
    
    
    //1005-1008, 1011-1014
    for (x=[-152,-92,-20,20,92,152]) {
        trou(x,10);    
    }

    //1005-1008
    for (x=[-38-2,-58-2,38+2,58+2]) {
        trou(x,-5);    
    }   
    
    
    //1009-1010
    for (x=[-10,10]) {
        trou(x,-5);    
    }  

    //1011-1014
    for (x=[xBrasSecondaire2-500-8,xBrasSecondaire2-500+8,500-xBrasSecondaire2-8,500-xBrasSecondaire2+8]) {
        trou(x,-2);    
    }    

    //1015-1016
    for (x=[-176.2,176.2]) {
        trou(x-((10-sqrt(2))*(x/abs(x))), sqrt(2));    
    }
    //1015-1016
    for (x=[-160,160]) {
        trou(x,-12);    
    }
   

        
    //1017-1018
    for (x=[-84,10]) {
        trou(x,11);    
    }
    
    //1017-1018
    for (x=[xObturateur+6.5,xObturateur-15.5]) {
        trou(x,4);    
    }     
    
    echo("fix 308-309");
    
    trou(longueur-x308+8+2,0);
    trou(x308-x309-20,0);
    
    echo("/fix 308-309");
    
    //reference
    for (x=[-120,0,120],y=[20,80]) {
        trou(x,y);    
    }     
    
}

module outilCorniere1000() {
    difference() {
        translate([-180,-40,-20])cube([360,140,20]);
        //translate([0,0,-25]) cylinder(d=4,$fn=fnLocal,h=30);
        percageOutil1000();
    }
    
    
    //percageOutil100x();
    
    /*difference() {
        translate([-180,-7,3])cube([360,107,20]);
        translate([0,0,0]) cylinder(d=4,$fn=fnLocal,h=30);
        percageOutil100x();  
    }*/
}






module anim1000(n=18) {
    
    color("red") outilCorniere1000();
    if (n==1) translate([-26,-10]) profile301(); //1001
    if (n==2) translate([-48,-10]) profile301(); //1002
    if (n==3) translate([-500+48,-10]) profile301(); //1003
    if (n==4) translate([-500+26,-10]) profile301(); //1004

    if (n==5) translate([38,-12,2]) rotate([90,0,180]) profile301(); //1005
    if (n==6) translate([58,-12,2]) rotate([90,0,180]) profile301(); //1006
    if (n==7) translate([500-38,-12,2]) rotate([90,0,180]) profile301(); //1007
    if (n==8) translate([500-58,-12,2]) rotate([90,0,180]) profile301(); //1008

    if (n==9) translate([-8,-10,0]) profile303(); //1009
    if (n==10) translate([-496+8,-10,0]) profile303(); //1010

    if (n==11) translate([xBrasSecondaire2-2-8,-12,0]) rotate([90,0,180]) profile303(); //1011
    if (n==12) translate([xBrasSecondaire2-2+8,-12,0]) rotate([90,0,180]) profile303(); //1012
    if (n==13) translate([498-xBrasSecondaire2-8,-12,0]) rotate([90,0,180]) profile307(); //1013
    if (n==14) translate([498-xBrasSecondaire2+8,-12,0]) rotate([90,0,180]) profile307(); //1014

    if (n==15) translate([-176.2,-10]) profile302(); //1015
    if (n==16) translate([-430+176.2,-10]) profile302(); //1016

    if (n==17) translate([xObturateur+6.5-2,-11,0]) rotate([90,0,180]) profile303(); //1017
    if (n==18) translate([xObturateur-15.5-2,-11,0]) rotate([90,0,180]) profile303(); //1018
        
    if (n==19) translate([-x308+10+2,-10,0]) rotate([0,0,0]) profile303();
    if (n==20) translate([-x309-10+2,-10,0]) rotate([0,0,0]) profile303();
}


//anim1000(round($t*18)+1);
//anim1000(20);
//projection() outilCorniere1000();


module percageOutil1030() {
    trou(0,0);    
    
    //1010 > Y
    for (x=[-100,-20]) {
        trou(x,12);    
    }
    //1010 > X
    for (x=[12,72]) {
        trou(x,5);    
    }

    //1011 > X
    for (x=[50,8]) {
        trou(x,-5);    
    }   
   
    //1012 > Y
    for (x=[-110,-30]) {
        trou(x,13);    
    } 
    //1012 > X
    for (x=[15,35]) {
        trou(x,0);    
    }    
 
    //1013 > Y
    for (x=[-60,60]) {
        trou(x,8);    
    }    
    //1013 > X
    for (x=[140,156]) {
        trou(x,0);    
    }    
    
    //1015 > X
    trou(70,12); 
    for (x=[14,y312-40+2,111,y312+2,151]) {
        trou(x,-6);    
    }    
    
    //reference
    for (x=[-120,0,120],y=[20,80]) {
        trou(x,y);    
    }     
    
}

module outilTube1030() {
    difference() {
        translate([-180,-40,-20])cube([360,140,20]);
        //translate([0,0,-25]) cylinder(d=4,$fn=fnLocal,h=30);
        percageOutil1030();
    }
    
    
    //percageOutil100x();
    
    /*difference() {
        translate([-180,-7,3])cube([360,107,20]);
        translate([0,0,0]) cylinder(d=4,$fn=fnLocal,h=30);
        percageOutil100x();  
    }*/
}


//anim1030(round($t*13)+1);
module anim1030(n=13) {
    color("red") outilTube1030();

    if (n == 1) translate([10,10,0]) rotate([0,0,180]) tube312();// 1031
    if (n == 2) translate([70,10,0]) rotate([0,0,180]) tube312();// 1032

    if (n == 3) translate([-203,10,0]) rotate([90,0,0]) tube312();// 1033
    if (n == 4) translate([-245,10,0]) rotate([90,0,0]) tube312();// 1034

    if (n == 5) translate([-357,11,0]) rotate([90,0,0]) tube314();// 1035
    if (n == 6) translate([-337,11,0]) rotate([90,0,0]) tube314();// 1036

    if (n == 7) translate([-232,6,0]) rotate([90,0,0]) tube314();// 1037
    if (n == 8) translate([-216,6,0]) rotate([90,0,0]) tube314();// 1038

    if (n == 9) translate([12,10]) rotate([0,0,180]) tube311();// 1039
    if (n == 10) translate([y312,10]) rotate([0,0,180]) tube311();// 1040
    if (n == 11) translate([y312-40,10]) rotate([0,0,180]) tube311();// 1041

    if (n == 12) translate([109,10]) rotate([0,0,180]) tube313();// 1042
    if (n == 13) translate([149,10]) rotate([0,0,180]) tube313();// 1043
}

module percageOutil1060() {
    trou(0,0,4);    // 4mm
    trou(-20,0,3);    // 3mm
    trou(20,0,5);    // 5mm
    
    //1020 > Y
    for (x=[-130,-20,20,130]) {
        trou(x,18);    
    }
    
    //1020 > X
    for (x=[-9,9,-32,32]) { //5mm
        trou(x+20,-4);    
    }

    
    //fixation moteur
    trou(-110,18.5);
    trou(-10,18.5);
    trou(-1,-7);
    trou(-130,5.5);
    trou(-30,5.5);
    trou(-1-sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),-12);
    trou(-1+sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),-12);
    
    
    //fixation couteau
    for (x=[-120,-20,20,120]) {
        trou(x,10);
        
    }
    for (x=[-120,0,120]) trou(x,15);
    
    for (x=[xCouteauIII-18,xCouteauIII+12,-xCouteauIII-12,-xCouteauIII+18]) {
        trou(x,0);
    }
    
    //moteur
    trou(110,zMotor+2);
    trou(10,zMotor+2);
    trou(-xMotor-2,-10);    
    
    
    trou(30,zMotor+fixMoteur1Y+2);
    trou(130,zMotor+fixMoteur1Y+2);
    trou(-xMotor-fixMoteur1X-2,-10);    


    //15
    /*trou(30,zMotor+fixMoteur2Y+2);
    trou(130,zMotor+fixMoteur2Y+2);
    trou(-xMotor+fixMoteur2X-2,10);*/
    echo("début correctif");
    trou(-50,zMotor+fixMoteur2Y+2-3);
    trou(110,zMotor+fixMoteur2Y+2-3);
    trou(-xMotor+fixMoteur2X-2-60,10-3);
    trou(-60,-3);
    echo("fin correctif");
    
    
    trou(-45,9);
    trou(-145,9);
    
    trou(-30,14);
    trou(-140,14);
    trou(30,-10);
    trou(-40,6);
    trou(-140,6);
    
    trou(-lBrasSecondaire+xPulley,-19);
    
    
    //16-17
    echo("fix 16-17");
    trou(-37,11);
    trou(-130,11);
    trou(-37,19);
    trou(-145,19);
    
    echo("/fix 16-17")
    
    
    
    
    //reference
    for (x=[-120,0,120],y=[28,80]) {
        trou(x,y);    
    }     
    
}


module outilCorniere1060() {
    color("red") difference() {
        translate([-180,-40,-20])cube([360,140,20]);
        //translate([0,0,-25]) cylinder(d=4,$fn=fnLocal,h=30);
        percageOutil1060();
    }
    
    
    
    
    /*difference() {
        translate([-180,-7,3])cube([360,107,20]);
        translate([0,0,0]) cylinder(d=4,$fn=fnLocal,h=30);
        percageOutil1060();  
        translate([-60,-3,10]) cylinder(d=8,h=20,$fn=32);
    }*/
    
    
}



//anim1060(round($t*17)+1);
anim1060(15);

//outilCorniere1060();
//projection() outilCorniere1060();

module anim1060(n=1) {
//projection() {
color("red") outilCorniere1060();
    //percageOutil102x();

echo(n);

//5mm
if (n==1) translate([7+20,-14,30]) rotate([180,0,180]) profile305();//1061
if (n==2) translate([403+20,-14,30]) rotate([180,0,180]) profile305();//1062
if (n==3) translate([30+20,-14,30]) rotate([180,0,180]) profile306();//1063
if (n==4) translate([426+20,-14,30]) rotate([180,0,180]) profile306();//1064

//3mm
if (n==5) translate([-436,16.5,0]) rotate([90,0,0]) profile305();//1065
if (n==6) translate([-436-sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),3.5,0]) rotate([90,0,0]) profile305();//1066
if (n==7) translate([-436+sqrt(pow(9.5,2)-pow((zMotor-3.5),2)),3.5,0]) rotate([90,0,0]) profile305();//1067

if (n==8) translate([-xPulley-20,7,0]) rotate([90,0,0]) profile306();//1068 !!!butée X


//4mm
if (n==9) translate([-lBrasSecondaire+xCouteauIII+10,13,0]) rotate([90,0,0]) profile305();//1069
if (n==10) translate([-lBrasSecondaire+xCouteauIII-20,13,0]) rotate([90,0,0]) profile305();//1070


if (n==11) translate([-xCouteauIII-10,13,0]) rotate([90,0,0]) profile306();//1071
if (n==12) translate([-xCouteauIII+20,13,0]) rotate([90,0,0]) profile306();//1072

if (n==13) translate([-xMotor,zMotor,0]) rotate([90,0,0]) profile306();//1073
if (n==14) translate([-xMotor-fixMoteur1X,zMotor+fixMoteur1Y,0]) rotate([90,0,0]) profile306();//1074
//if (n==15) translate([-xMotor+fixMoteur2X,zMotor+fixMoteur2Y,0]) rotate([90,0,0]) profile306();//1075 !!! trop porofond
if (n==15) translate([-xMotor+fixMoteur2X-60,zMotor+fixMoteur2Y - 3,0]) rotate([90,0,0]) profile306();//1075

if (n==16) translate([-lBrasSecondaire+28,9,0]) rotate([90,0,0]) profile306();//1076
if (n==17) translate([-lBrasSecondaire+28,17,0]) rotate([90,0,0]) profile306();//1077
}