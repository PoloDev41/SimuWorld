
function scr_actionNeuron_MoveX(output, being, world){

	move = 0;
	if(output > 0)
		move++;
	else if(output < 0)
		move--;
	newX = being.x + move;
	if(newX > 0 && newX < world.world_width)
		being.x = newX;
	being.energie -= abs(move);
}

function scr_actionNeuron_MoveY(output, being, world){

	move = 0;
	if(output > 0)
		move++;
	else if(output < 0)
		move--;
	newY = being.y + move;
	if(newY > 0 && newY < world.world_height)
		being.y = newY;
	being.energie -= abs(move);
}