function scr_perlinNoise2d(){
	// Définir la largeur et la hauteur du tableau
	width = obj_world.world_width/obj_world.cellSize;
	height = obj_world.world_height/obj_world.cellSize;
	
	// Initialisez le tableau de gradients
	var gradient = [];
	var noise_map = [];

	for (var i = 0; i < 256; i++) {
	  for (var j = 0; j < 256; j++) {
	    gradient[i][j] = irandom_range(-1, 1);
	  }
	}
	
	for (var i = 0; i < width; i++) {
	  for (var j = 0; j < height; j++) {
		noise_map[i][j] = 0;
	  }
	}
	
	// Paramètres de l'algorithme de Perlin
	var octaves = 4;
	var persistence = 0.5;
	var x_step = 1;
	var y_step = 1;

	// Ajoutez cette ligne pour définir la fréquence
	//valeur par défaut: 0.01
	var freq = 0.01;

	// Boucle sur les octaves
	for (var o = 0; o < octaves; o++) {

	  // Boucle sur les lignes
	  for (var i = 0; i < width; i++) {

	    // Boucle sur les colonnes
	    for (var j = 0; j < height; j++) {

	      // Calculez les indices des gradients sur la grille
	      var gi1 = floor(i / x_step) % 256;
	      var gi2 = floor(j / y_step) % 256;

	      // Calculez les poids en fonction de la distance à partir des gradients
	      var x_weight = (i / x_step) - floor(i / x_step);
	      var y_weight = (j / y_step) - floor(j / y_step);

	      // Interpolez les perturbations du gradient pour produire des valeurs de bruit
	      var noise = gradient[gi1][gi2] * x_weight * y_weight;
	      noise += gradient[(gi1 + 1) % 256][gi2] * (1 - x_weight) * y_weight;
	      noise += gradient[gi1][(gi2 + 1) % 256] * x_weight * (1 - y_weight);
	      noise += gradient[(gi1 + 1) % 256][(gi2 + 1) % 256] * (1 - x_weight) * (1 - y_weight);

	      // Ajoutez la contribution du bruit à la valeur totale
	      noise_map[i][j] += noise * persistence;
	    }
	  }
	  // Multipliez les étapes par la fréquence pour réduire la fréquence de perturbation
	  x_step *= freq;
	  y_step *= freq;

	  // Multipliez la persistance pour les octaves suivantes
	  persistence *= persistence;
	}
	
	return noise_map;
}