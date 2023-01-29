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