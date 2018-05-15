include <parameters.scad>;

/////////////////////////////////////////////////
/////              Fonctions                /////
/////////////////////////////////////////////////
module tubeCarre(cote, longueur, epaisseur) { //placé le long de X
    //color("LightGreen",1.0)
    difference() {
        cube([longueur,cote,cote]);
        translate([-1,epaisseur,epaisseur]) cube([longueur+2,cote - (2 * epaisseur),cote - (2 * epaisseur)]);        
    }
}

module tube(dExt, dInt, longueur) {
    rotate([0,90,0])
    difference() {
        cylinder(d=dExt, h=longueur, $fn=fnCylindre);
        translate([0,0,-1]) cylinder(d=dInt, h=longueur+2, $fn=fnCylindre);
    }
}

module toleTriangulaire (base,hauteur,epaisseur) { //placé le long de X, base en bas, dans le plan XY
    polyhedron(points = [
        [-base/2,0,0], //0
        [base/2,0,0],//1
        [0,hauteur,0],//2
        [-base/2,0,epaisseur], //3
        [base/2,0,epaisseur],//4
        [0,hauteur,epaisseur],//5
    ],
    faces=[
        [1,0,3,4],
        [0,2,5,3],
        [4,5,2,1],    
        [0,1,2],
        [5,4,3]
    ]);   
}

module profileU(hauteur,largeur,longueur,epaisseur) { //placé le long de X
    rArrondi = 1.0;
    
    color("LightGreen",1.0)
    difference() {
        cube([longueur,largeur,hauteur]);
        translate([-1,epaisseur,epaisseur]) cube([longueur+2,largeur - (2 * epaisseur),hauteur - epaisseur + 1]);        
    }
}

module corniere(cote, longueur, epaisseur) {
    difference() {
        cube([longueur,cote,cote]);
        translate([-1,epaisseur,epaisseur]) cube([longueur+2,cote,cote]);
    }
}

module corniere45(cote, longueur, epaisseur) {
    difference() {
        corniere(cote, longueur, epaisseur);
        rotate([0,0,-45]) translate([-cote*1.5,-1,-1]) cube([cote*1.5,cote*1.5,cote+2]);
        translate([longueur,0,0]) rotate([0,0,45]) translate([0,-1,-1])cube([cote*1.5,cote*1.5,cote+2]);
    }    
}



module cornierePercee(longueur) {
    difference() {
        corniere45(20,longueur,2);
        for (x=[26,48,longueur-26,longueur-48]) 
            translate([x,10,0]) cylinder(eCorniereCadre+2,d=diametreRivet, $fn=fnCylindre); 
    }
}

module cornierePerceeNonFraisee(longueur) {
    difference() {
        corniere45(20,longueur,2);
        for (x=[26,48,longueur-26,longueur-48]) 
            translate([x,10,-1]) cylinder(d=diametreRivet, h=4, $fn=fnCylindre);
    }
}