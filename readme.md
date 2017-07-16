# Lengaburu War

Our problem is set in the planet of Lengaburu…in the distant
distant galaxy of Tara B. Our protagonists are King Shan, the
emperor of Lengaburu, and the evil queen Al Falcone of
Falicornia
Lengaburu has been at peace with her neighbours for over 50
years but now…. planet Falicornia dares attack Lengaburu.
Write code to help King Shan identify the optimal force he
should deploy to defend Lengaburu. Al Falcone has a larger army than King Shan. But she cannot leave her home planet unprotected. So she will always deploy a sub set of her army. Moreover King Shan’s army unit is 2X more stronger than Al Falcone’s.  

If Falicornia attacks Lengaburu with 2 Horses, 2 Elephants, 2 Armoured Tanks and 2 Sling Guns, Lengaburu will win the war if King Shan matches the attack with 1 Horse, 1 Elephant, 1 Armoured Tank and 1 Sling Gun. But not so fast! Al Falcone will surely attack with a larger army. Your coding challenge is to identify what battalions, and how many units of each battalion King Shan should deploy to match Al Falcone's attack


## Rules of the war

 * **Rule 1: The Power Rule:** Each Lengaburu army unit is 2X more powerful than their Falcornia counterpart. Example: 1
Lengaburu Horse can counter 2 Falicornia Horses, 1 Lengaburu Elephant can counter 2 Falicornia Elephants and so on. 
 * **Rule 2: The Like-to-Like Rule:** Falicornia Horses battalion should be countered with Lengaburu horses battalion,
Elephants with elephants and so on. Except when the battalion is completely exhausted (see Rule #3). 
 * **Rule 3:  The Substitution Rule:**  When all units of a particular Lengaburu battalion is exhausted, a different type of battalion can be
used. 1 Elephant can replace 2 Horses (and 2 Horses can replace 1 Elephant), 1 Armoured Tank can replace 2 Elephants (and
vice versa) and 1 Sling Gun can replace 2 Armoured Tanks (and vice versa).
* **Rule 4:  The Substitution Choice Rule:**  When there are 2 possibilities of substitution, then always a lower ranked battalion should
be used (Horses is lower than Elephants, is lower than Armoured Tanks, is lower than Sling Guns) 

-----