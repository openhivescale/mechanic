niveauDetail = 5;
fnCylindre = 32;
//pourImpression3D = false; 
pourImpression3D = 0;


epaisseurTole = 2;
epaisseurCouteau = 4;

diametreRivet = pourImpression3D ? 4.2 : 4.1;
drillM3 = 3.2;
drillM4 = 4.2;
drillM5 = 5.2;
drillM8 = 8.2;

diametrePetitsBoulons = pourImpression3D ? 3.4 : 3;
jeuPourImpression = pourImpression3D ? 0.2 : 0;
laserSlack = 0.1;




longueur = 500;
largeur = 430;
offsetCouteau = 20;
//hauteurCadre = 20;
lCorniereCadre = 20;
eCorniereCadre = 2;
lIntCornierCadre = lCorniereCadre - eCorniereCadre;
zPlateau = 90; //72;

zCouteau = zPlateau / 2; //hauteurCouteau + lCorniereCadre;
hauteurCouteau = zCouteau - lCorniereCadre; //(zPlateau - 2 * lCorniereCadre) / 2;

xCouteauInferieur = 38;
xCouteauSuperieur = xCouteauInferieur + offsetCouteau ;


entretoiseCouteau = 5;

taillePetitEcrou = 5.5;


largeurBras = 60;

xBrasSecondaire = 35;


//zBrasSecondaire = 50; //34;
zBrasSecondaire = 45;



z = zPlateau / 2;


l312 = 251;
l314 = 370;
spacer104N = 5;
spacer104Thick = 0.8;
spacer104 = spacer104N * spacer104Thick; //4; 

y314 = largeur/2-largeurBras/2-1-epaisseurCouteau-21-10;
y312 = y314 - epaisseurCouteau - 20 - (2 * spacer104);

color100 = "pink";
color200 = "lightblue";
color300 = "orange";
color310 = "lightgreen";



lBrasSecondaire = 433; //23
xPulley = lBrasSecondaire - 9;
xMotor = xPulley - 407; //(852 - 32mm (16dents)) / 2 - 3mm de marge car dans la vrai vie avec le tendeur....

xObturateur = 60;


zMotor = 7;
rotationMoteur=150;
a1 = atan(8/17.5);
a2 = a1-30;
a3 = a1+30;
fixMoteurR = sqrt(pow(8,2)+pow(17.5,2));
fixMoteur1X=cos(a2)*fixMoteurR;
fixMoteur1Y=sin(a2)*fixMoteurR;
fixMoteur2X=cos(a3)*fixMoteurR;;
fixMoteur2Y=sin(a3)*fixMoteurR;;



xAxegravite = 321.1641094468;
zAxegravite = 10.7211946502;
xCouteauIII = 112;

//Support du bras secondaire
//Support du bras secondaire
xBrasSecondaire2 = longueur - xBrasSecondaire - xCouteauIII;

//xBrasSecondaire2 = 353;

xAppuiLong = longueur - xBrasSecondaire - xCouteauIII + 20;

zCouteauBrasSecondaire = zCouteau - zBrasSecondaire;

l303304 = longueur - 2*eCorniereCadre;

l308309 = (largeur-2*eCorniereCadre-(largeurBras+2*0.8))/2 - 0.2;
x308 = longueur - 105;
x309 = x308 - 100 - 2*eCorniereCadre;

spacer108 = 0.8;

y303 = largeur/2 - largeurBras/2 - 0.8;
y304 = largeur/2 + largeurBras/2 + 0.8; 
//y1 = largeur/2 - largeurBras/2 - 0.8;
//y2 = largeur/2 + largeurBras/2 + 0.8; 

//xContrePoids = longueurCornieres-17-55;

yMediane = largeur/2;
ySupportFromMediane = (largeurBras / 2) - eCorniereCadre + 0.8 + 10;