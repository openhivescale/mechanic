include <assembly.scad>

//animation = 46;
animationPerPart(animation);

module animationPerPart(animation) {
    if (animation >= 41) {
        cadreSup(animation - 41); //5
    } else if (animation >= 33) { // 33 -> 40       
        assemblageTriangle1(animation - 33); //7
    } else if (animation >= 24) { // 24 -> 32
        assemblageTriangle2(animation - 24); //8  
    } else if (animation >= 10) { // 10 -> 23
        translate([longueur-xBrasSecondaire,largeur/2+largeurBras/2,zBrasSecondaire]) rotate([0,0,180]) brasSecondaire(animation - 10); //13  
    } else if (animation >= 0) {
        cadreInf(animation); // 9        
    }
}