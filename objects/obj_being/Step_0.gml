lifetime++;

if(lifetime > 5)
{
	var obj = instance_nearest(x, y, obj_fruit);

	brain.RunBrain(id, obj);
	energie -= lifetime/1000;

	if(energie <= 0)
	{
		instance_destroy(id);
	}
	else if(energie >= ENERGIE_EGG_GENERATION)
	{
		energie -= (ENERGIE_EGG_GENERATION/2);
		instance_create_layer(x, y, "Instances", obj_egg,
		{
		    energie : 100,
			parent : id
		});
	}
}
