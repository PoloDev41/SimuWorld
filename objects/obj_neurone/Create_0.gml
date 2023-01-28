source = [];
weight = [];
output = 0;

function RunNeurone(brain)
{
	var sum = 0;
	for(i=0; i<array_length(source);i++)
	{
		sum += brain.neurons[source[i]].output * weight[i];
	}
	output = sum;
}