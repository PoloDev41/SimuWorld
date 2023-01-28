//to get the position of fruit
neurons[0] = instance_create_layer(0,0,0, obj_neurone);
neurons[1] = instance_create_layer(0,0,0, obj_neurone);
//to compute
neurons[2] = instance_create_layer(0,0,0, obj_neurone);
neurons[2].source = [0,1];
neurons[2].weight =  [random_range(-1,1), random_range(-1,1)];

neurons[3] = instance_create_layer(0,0,0, obj_neurone);
neurons[3].source = [0,1];
neurons[3].weight =  [random_range(-1,1), random_range(-1,1)];

function RunBrain(being, fruit)
{
	if(fruit != noone)
	{
		neurons[0].output = (fruit.x - being.x);
		neurons[1].output = (fruit.y - being.y);
	}
	else
	{
		neurons[0].output = 0;
		neurons[1].output = 0;
	}
	
	for(var i = 2; i < array_length(neurons); i++){
		neurons[i].RunNeurone(id);
	}
	
	sum = neurons[array_length(neurons)-2].output;
	move = 0;
	if(sum > 0)
		move++;
	else if(sum < 0)
		move--;
	newX = being.x + move;
	if(newX > 0 && newX < obj_world.world_width)
		being.x = newX;
	being.energie -= abs(move);
		
	sum = neurons[array_length(neurons)-1].output;
	move = 0;
	if(sum > 0)
		move++;
	else if(sum < 0)
		move--;
	newY = being.y + move;
	if(newY > 0 && newY < obj_world.world_height)
		being.y = newY;
	being.energie -= abs(move);
	
	being.energie -= array_length(neurons)
}