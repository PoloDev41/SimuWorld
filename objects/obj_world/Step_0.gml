lifetime++;

if(lifetime >= 80)
{
	lifetime = 0;
	instance_create_layer(random_range(0, obj_world.world_width),
						random_range(0, obj_world.world_height),
						"Instances", obj_fruit);
}

var number = instance_number(obj_being);
if(number <= 0)
{
	for(i = 0; i < 10; i++)
	{
		instance_create_layer(random_range(0, world_width),
							random_range(0, world_height),
							"Instances", obj_being);
	}
}


