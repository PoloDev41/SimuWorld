
function scr_inputNeuron_NearestX(being, world){
	var obj = instance_nearest(being.x, being.y, obj_fruit);
	if(obj != noone)
	{
		return (obj.x - being.x);
	}
	else
	{
		return 0;
	}
}

function scr_inputNeuron_NearestY(being, world){
	var obj = instance_nearest(being.x, being.y, obj_fruit);
	if(obj != noone)
	{
		return (obj.y - being.y);
	}
	else
	{
		return 0;
	}
}