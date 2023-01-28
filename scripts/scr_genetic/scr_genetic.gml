function scr_cloneBrain(parent, withModification){
	var newBrain = instance_create_layer(0,0,0,obj_brain);
	
	for(i = 2; i < array_length(parent.brain.neurons); i++)
	{
		parentNeuron = parent.brain.neurons[i];
		for(j = 0; j < array_length(parentNeuron.source); j++)
		{
			newBrain.neurons[i].source[j] = parentNeuron.source[j];
			if(withModification && random(100) < 10)
			{
				newBrain.neurons[i] = irandom_range(-1,1);
			}
			else
			{
				newBrain.neurons[i].weight[j] = parentNeuron.weight[j];
			}
		}
	}
	return newBrain;
}