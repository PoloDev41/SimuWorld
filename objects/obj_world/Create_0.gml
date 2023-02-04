world_height = 900
world_width = 1200

view_camera[0] = camera_create_view(-50, -50, world_width+100, world_height+100);

randomise();

lifetime = 0;

for(i = 0; i < 10; i++)
{
	instance_create_layer(random_range(0, world_width),
						random_range(0, world_height),
						"Instances", obj_being);
}

for(i = 0; i < 10; i++)
{

	instance_create_layer(random_range(0, world_width),
							random_range(0, world_height),
							"Instances", obj_fruit);
}

show_debug_message("creation done");

cellSize = 20;
noise_map = scr_perlinNoise2d()

// Création d'une surface pour stocker l'image
surface_map = surface_create(world_width, world_height);
surface_set_target(surface_map);
// Boucle pour dessiner les valeurs de bruit de Perlin 2D à l'écran
for (var i = 0; i < world_width/cellSize; i++) {
    for (var j = 0; j < world_height/cellSize; j++) {
		var color = make_color_rgb(noise_map[i][j] * 255, noise_map[i][j] * 255, noise_map[i][j] * 255);
		draw_set_colour(color);
		// Remplissage de la surface avec la couleur
        draw_rectangle(i * cellSize, j * cellSize, (i + cellSize) * cellSize, (j + cellSize) * cellSize, false);
    }
}
// Redirection du rendu vers l'écran
surface_reset_target();
