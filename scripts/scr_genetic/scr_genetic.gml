function scr_cloneBrain(parent, withModification){
	newBrain = new Brain(true);
	
	try{
		
		for(i = 0; i < array_length(parent.brain.neurons); i++)
		{
			parentNeuron = parent.brain.neurons[i];
			newNeuron = new Neuron();
			newNeuron.receptor = parentNeuron.receptor;
			newNeuron.action = parentNeuron.action;
			
			for(j = 0; j < array_length(parentNeuron.source); j++)
			{
				//copy the source
				if(withModification && irandom(100) < 2)
				{
					newNeuron.source[j] = irandom_range(0,array_length(parent.brain.neurons)-1);
				}
				else
				{
					newNeuron.source[j] = parentNeuron.source[j];
				}
				//copy the weight
				if(withModification && irandom(100) < 5)
				{
					newNeuron.weight[j] = random_range(-1,1);
				}
				else
				{
					newNeuron.weight[j] = parentNeuron.weight[j];
				}
			}
			array_push(newBrain.neurons, newNeuron);
		}
		
		show_debug_message("state of the new brain");
		show_debug_message("number of neurons: " + string(array_length(newBrain.neurons)));
		
		//create a new neuron
		if(withModification && irandom(100) < 100)
		{
			neuron = new Neuron();
			var nbrNeurons = array_length(newBrain.neurons);
			//the new neuron create connection to the others
			var nbrInput = irandom_range(1,3);
			for(i = 0; i < nbrInput; i++)
			{
				neuron.source[i] = irandom(nbrNeurons);
				neuron.weight[i] = random_range(-1,1);
			}
			//the "others" try to connect to it
			var nbrConnection = irandom(nbrNeurons-1);
			for(i = 0; i < nbrConnection; i++)
			{
				n = newBrain.neurons[irandom(nbrNeurons-1)];
				
				//if source = 0, it means, it's a input neuron, don't connect
				if(n.source != noone && array_length(n.source) > 0)
				{
					array_push(n.source, nbrNeurons);
					array_push(n.weight, random_range(-1,1));
				}				
			}
				
			array_push(newBrain.neurons, neuron);
		}
	}
	catch( _exception)
	{
	    show_debug_message(_exception.message);
	    show_debug_message(_exception.longMessage);
	    show_debug_message(_exception.script);
	    show_debug_message(_exception.stacktrace);
	}
	return newBrain;
}