ENERGIE_START = 10000;
ENERGIE_EGG_GENERATION = ENERGIE_START + 1;

function create()
{
	brain = new Brain();
	energie = ENERGIE_START;
	lifetime = 0;
	generation = 1;
}

create();