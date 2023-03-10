function Brain(copied = false) constructor
{
	neurons = [];
		
	if(copied == false)
	{
		//to get the position of fruit
		neurons[0] = new Neuron();
		neurons[0].receptor = scr_inputNeuron_NearestX;
		neurons[1] = new Neuron();
		neurons[1].receptor = scr_inputNeuron_NearestY;
		//to compute
		neurons[2] = new Neuron();
		neurons[2].source = [0,1];
		neurons[2].weight =  [random_range(-1,1), random_range(-1,1)];
		neurons[2].action = scr_actionNeuron_MoveX

		neurons[3] = new Neuron();
		neurons[3].source = [0,1];
		neurons[3].weight =  [random_range(-1,1), random_range(-1,1)];
		neurons[3].action = scr_actionNeuron_MoveY;
	}
	
	static RunBrain = function(being, world)
	{
		try{
	
			for(var i = 0; i < array_length(neurons); i++){
				neurons[i].RunNeurone(being, world);
			}
	
			being.energie -= array_length(neurons)
		}
		catch( _exception)
		{
		    show_debug_message(_exception.message);
		    show_debug_message(_exception.longMessage);
		    show_debug_message(_exception.script);
		    show_debug_message(_exception.stacktrace);
			instance_destroy(id);
			instance_destroy(being);
		}
	}
}