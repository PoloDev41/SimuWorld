for(var i = 0; i < 2; i++){
  for(var j = 0; j < 2; j ++){
    neurons[i, j] = random_range(-1,1);
  }
}

function RunBrain(being, fruit)
{
	neuron = neurons[0];
	var sum = neuron[0] * (fruit.x - being.x);
	sum = sum + neuron[1] * (fruit.y - being.y);
	move = 0;
	if(sum > 0)
		move++;
	else if(sum < 0)
		move--;
	newX = being.x + move;
	if(newX > 0 && newX < obj_world.world_width)
		being.x = newX;
	being.energie -= (move + array_length(neuron));
		
	neuron = neurons[1];
	var sum = neuron[0] * (fruit.x - being.x);
	sum = sum + neuron[1] * (fruit.y - being.y);
	move = 0;
	if(sum > 0)
		move++;
	else if(sum < 0)
		move--;
	newY = being.y + move;
	if(newY > 0 && newY < obj_world.world_height)
		being.y = newY;
	being.energie -= (move + array_length(neuron));
}