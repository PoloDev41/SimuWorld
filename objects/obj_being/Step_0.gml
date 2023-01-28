var obj = instance_nearest(x, y, obj_fruit);

if(obj != noone)
{
	brain.RunBrain(id, obj);
}

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