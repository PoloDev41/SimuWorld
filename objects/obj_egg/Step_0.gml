energie--;

if(energie <= 0)
{
	instance_create_layer(x,y,"Instances", obj_being);
	instance_destroy(id);	
}
