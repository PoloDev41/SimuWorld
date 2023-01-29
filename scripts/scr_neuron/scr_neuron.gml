function Neuron() constructor
{
	source = [];
	weight = [];
	output = 0;
	receptor = noone;
	action = noone;

	static RunNeurone = function(being, world)
	{
		if(receptor != noone)
		{
			output = receptor(being, world);
		}
		else
		{
			var sum = 0;
			for(i=0; i<array_length(source);i++)
			{
				sum += being.brain.neurons[source[i]].output * weight[i];
			}
			output = sum;
			if(action != noone)
			{
				action(output, being, world);
			}
		}

	}
}

