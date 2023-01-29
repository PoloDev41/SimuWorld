function scr_cloneBrain(parent, withModification){
	newBrain = new Brain(true);
	
	try{
		
		for(i = 0; i < array_length(parent.brain.neurons); i++)
		{
			parentNeuron = parent.brain.neurons[i];
			newNeuron = new Neuron();
			if(withModification && irandom(100) < 2)
			{
				//do nothing (remove the receptor)
			}
			else
			{
				newNeuron.receptor = parentNeuron.receptor;
			}	
			if(withModification && irandom(100) < 2)
			{
				//do nothing (remove the action)
			}
			else
			{
				newNeuron.action = parentNeuron.action;
			}	
			
			for(j = 0; j < array_length(parentNeuron.source); j++)
			{
				if(withModification && irandom(100) < 2)
				{
					//do nothing (remove the connection)
				}
				else
				{
					//copy the source
					if(withModification && irandom(100) < 2)
					{
						newNeuron.source[j] = irandom(array_length(parent.brain.neurons)-1);
					}
					else
					{
						newNeuron.source[j] = parentNeuron.source[j];
					}
					//copy the weight
					if(withModification && irandom(100) < 5)
					{
						if(withModification && irandom(100) < 50)
							newNeuron.weight[j] = random_range(-1,1);
						else
							newNeuron.weight[j] = parentNeuron.weight[j] + random_range(-1,1);
					}
					else
					{
						newNeuron.weight[j] = parentNeuron.weight[j];
					}
				}
			}
			//create a new connection
			if(withModification && irandom(100) < 2)
			{
				newNeuron.source[array_length(newNeuron.source)] = irandom(array_length(parent.brain.neurons)-1);
				newNeuron.weight[array_length(newNeuron.weight)] = random_range(-1,1);
			}
			array_push(newBrain.neurons, newNeuron);
		}
		
		//create a new neuron
		if(withModification && irandom(100) < 2)
		{
			neuron = new Neuron();
			var nbrNeurons = array_length(newBrain.neurons);
			//the new neuron create connection to the others
			var nbrInput = irandom(3);
			if(nbrInput == 0)
			{
				//no input, take an input neuron
				if(irandom(100) < 50)
				{
					receptor = scr_inputNeuron_NearestX;
				}
				else
				{
					receptor = scr_inputNeuron_NearestY;
				}
			}
			else
			{
				for(i = 0; i < nbrInput; i++)
				{
					neuron.source[i] = irandom(nbrNeurons);
					neuron.weight[i] = random_range(-1,1);
				}
				
				if(irandom(100) < 10)
				{
					//add action
					if(irandom(100) < 50)
					{
						action = scr_actionNeuron_MoveX;
					}
					else
					{
						action = scr_actionNeuron_MoveY;
					}
				}
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