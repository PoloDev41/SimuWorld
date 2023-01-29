lifetime++;

if(lifetime > 5)
{
	brain.RunBrain(id, instance_find(obj_world,0));
	
	energie -= lifetime/1000;

	if(energie <= 0)
	{
		instance_destroy(id);
	}
	else if(energie >= ENERGIE_EGG_GENERATION)
	{
		energie -= (ENERGIE_EGG_GENERATION/2);
		var e = instance_create_layer(x, y, "Instances", obj_egg,
		{
		    energie : 100,
		});
		e.brain = scr_cloneBrain(id, true);
		e.generation = generation +1;
	}
}
