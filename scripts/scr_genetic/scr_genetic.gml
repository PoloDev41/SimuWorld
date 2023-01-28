function scr_cloneBrain(parent, withModification){
	var newBrain = instance_create_layer(0,0,obj_brain);
	
	for(i = 0; i < array_length(parent.brain); i++)
	{
		for(j = 0; j < array_length(parent.brain[i]); j++)
		{
			if(withModification && random(100) < 10)
			{
				newBrain[i][j] = irandom_range(-1,1);
			}
			else
			{
				newBrain[i][j] = parent.brain[i][j];
			}
		}
	}
	return newBrain;
}