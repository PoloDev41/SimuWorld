energie--;

if(energie <= 0)
{
	b = instance_create_layer(x,y,"Instances", obj_being);
	b.generation = generation;
	b.brain = brain;

	instance_destroy(id);	
}
