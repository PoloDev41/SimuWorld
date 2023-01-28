energie--;

if(energie <= 0)
{
	instance_create_layer(x,y,"Instances", obj_being,
	{
		brain: scr_cloneBrain(parent, true)
	});
	instance_destroy(id);	
}
