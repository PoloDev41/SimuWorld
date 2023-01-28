energie--;

if(energie <= 0)
{
	b = instance_create_layer(x,y,"Instances", obj_being,
	{
		brain: scr_cloneBrain(parent, true),
	});
	b.generation = parent.generation+1;
	
	instance_destroy(id);	
}
