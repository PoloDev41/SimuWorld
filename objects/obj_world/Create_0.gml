world_height = 500
world_width = 750

view_camera[0] = camera_create_view(-world_width/2, -world_height/2, view_wport[0], view_hport[0]);

randomise();

for(i = 0; i < 10; i++)
{
	instance_create_layer(random_range(0, world_width),
						random_range(0, world_height),
						"Instances", obj_being);
}

instance_create_layer(random_range(0, world_width),
						random_range(0, world_height),
						"Instances", obj_fruit);