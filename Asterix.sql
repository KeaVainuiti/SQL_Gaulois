1. SELECT * FROM `potion`;

2. SELECT `NomCateg` 
FROM `categorie` 
WHERE `NbPoints`=3;

3. SELECT `NomVillage` 
FROM `village` 
WHERE `NbHuttes`>35;

4. SELECT `NumTrophee` 
FROM `trophee` 
WHERE `DatePrise` 
BETWEEN '2052-05-01' AND '2052-06-31';

5. SELECT `Nom` 
FROM `habitant` 
WHERE `Nom` LIKE 'A%' AND `Nom` LIKE '%r%';

6. SELECT DISTINCT `NumHab` 
FROM `absorber` 
WHERE `NumPotion`=1 OR `NumPotion`=3 OR `NumPotion`=4;

7. SELECT `NumTrophee`, `DatePrise`, `NomCateg` , `Nom` 
FROM `trophee` T, `categorie` C , `habitant` H 
WHERE T.`CodeCat` = C.`CodeCat`
And T.`NumPreneur` = H.`NumHab;

8. SELECT `Nom` 
FROM `habitant` H, `village` V 
WHERE H.`NumVillage` = V.`NumVillage` 
AND V.`NomVillage` LIKE 'Aquilona';

9. SELECT `Nom`
FROM `habitant` H, `trophee`T, `categorie`C 
WHERE H.`NumHab` = T.`NumPreneur` 
AND T.`CodeCat` = C.`CodeCat` 
AND C.`NomCateg` LIKE 'Bouclier de Légat';

10. SELECT `LibPotion`, `Formule`, `ConstituantPrincipal` 
sFROM `potion` P, `fabriquer`F, `habitant` H 
WHERE P.`NumPotion`= F.`NumPotion` 
AND F.`NumHab` =H.`NumHab` 
AND H.`Nom` LIKE 'Panoramix';


11. SELECT `LibPotion` 
FROM `potion` P, `absorber`A, `habitant` H 
WHERE P.`NumPotion`= A.`NumPotion` 
AND A.`NumHab` =H.`NumHab` 
AND H.`Nom` LIKE 'Homéopatix' 
GROUP BY LibPotion;



12. SELECT DISTINCT `Nom` 
FROM `habitant` AS h,`absorber` AS a,`fabriquer` AS f 
WHERE h.`NumHab` = a.`NumHab` 
AND a.`NumPotion` = f.`NumPotion` 
AND f.`NumHab` = 3;


13. SELECT DISTINCT `Nom` 
FROM `habitant` AS h,`absorber` AS a,`fabriquer` AS f 
WHERE h.`NumHab` = a.`NumHab` 
AND a.`NumPotion` = f.`NumPotion` 
AND f.`NumHab` = (SELECT `NumHab` FROM `habitant` WHERE `Nom` = "Amnésix");


14. SELECT `Nom` 
FROM `habitant` 
WHERE `NumQualite` IS NULL;

15.SELECT `Nom`
FROM `habitant` H, `absorber` A, `potion` P
WHERE H.`NumHab`  = A.`NumHab`
AND A.`NumPotion` = P.`NumPotion`
AND P.`LibPotion` = "Potion magique n°1"
AND A.`DateA` LIKE '2052-02%';


16.SELECT `Nom`, `Age` 
FROM `habitant` 
ORDER BY `Nom`;


17. SELECT `NomResserre`, `NomVillage`
FROM `resserre` R, `village` V 
WHERE R.`NumVillage` = V.`NumVillage` 
ORDER BY `Superficie` DESC;

18.SELECT COUNT(*)
FROM `habitant`
WHERE `NumVillage` = 5;

19.SELECT SUM(`NbPoints`)
FROM `categorie` C, `trophee` T, `habitant` H
WHERE C.`CodeCat` = T.`CodeCat`
AND T.`NumPreneur` = H.`NumHab`
AND H.`Nom` = "Goudurix";

20.SELECT `DatePrise` 
FROM `trophee` 
ORDER BY `DatePrise` LIMIT 0,1;

21.SELECT SUM(`Quantite`) 
FROM `absorber` A, `potion` P 
WHERE A.`NumPotion` = P.`NumPotion` 
AND P.`LibPotion` = "Potion magique n°2";

22.SELECT `Superficie` 
FROM `resserre` 
ORDER BY `Superficie` DESC 
LIMIT 0,1;

23.SELECT `NomVillage`, COUNT(*) 
FROM `habitant` H, `village` V 
WHERE H.`NumVillage` = V.`NumVillage` 
GROUP BY H.`NumVillage`

24.SELECT `Nom`, COUNT(*)
FROM `habitant` H, `trophee` T
WHERE H.`NumHab` =  T.`NumPreneur`
GROUP BY `Nom`;

25.SELECT `NomProvince`, AVG(`Age`) 
FROM `province` P, `village` V, `habitant` H 
WHERE P.`NumProvince` = V.`NumProvince` 
AND V.`NumVillage` = H.`NumVillage` 
GROUP BY `NomProvince`;

26.SELECT `Nom`, COUNT(DISTINCT `LibPotion`) 
FROM `habitant` H, `absorber` A, `potion` P 
WHERE H.`NumHab` = A.`NumHab` 
AND A.`NumPotion` = P.`NumPotion` 
GROUP BY `Nom`;

27.SELECT `Nom`
FROM `habitant` H, `absorber` A, `potion` P
WHERE H.`NumHab` = A.`NumHab`
AND A.`NumPotion` = P.`NumPotion`
AND P.`LibPotion` = "Potion Zen"
AND A.`Quantite` > 2;

28.SELECT `NomVillage`
FROM `village` V, `resserre` R
WHERE V.`NumVillage` = R.`NumVillage`;

29.SELECT `NomVillage`
FROM `village`
WHERE `NbHuttes` >= ALL (SELECT `NbHuttes` FROM `village`);

30.SELECT `Nom` FROM `habitant` H, `trophee` T 
WHERE H.`NumHab` = T.`NumPreneur` 
GROUP BY H.`Nom` 
HAVING COUNT(`Nom`) > (SELECT COUNT(*) 
						FROM `trophee` TR, `habitant` HA 
						WHERE HA.`NumHab` = TR.`NumPreneur` 
						AND HA.`Nom` = "Obélix")