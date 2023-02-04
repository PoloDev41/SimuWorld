draw_set_colour(c_yellow);
draw_rectangle(0, 0, world_width, world_height, true);

var number = instance_number(obj_being);
if(number > 0)
{
	var first = instance_find(obj_being,0);
	draw_text(0, -40, "being: " + string(number));
	draw_text(0, -20, "energie: " + string(first.energie) + "  life: " + string(first.lifetime) + "  nbr neurons: " + string(array_length(first.brain.neurons))  + "  generation: " + string(first.generation));
}

depth = 1;
draw_surface(surface_map, 0, 0);
