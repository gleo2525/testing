// Player queue
queue = ds_queue_create();



for (var p = 0; p < 2; p++){
	var player = instance_create_layer(x,y,"Instances",o_player);
	ds_queue_enqueue(queue, player);
}

currentplayer = ds_queue_dequeue(queue);
// currentplayer.max_vitality--;

enum item {
	sword,
	potion,
	shield,
	dice,
	null
}

type = item.null;

global.itemName[item.sword] = "sword";
global.itemName[item.potion] = "potion";
global.itemName[item.shield] = "shield";
global.itemName[item.dice] = "dice";


enum phase {
	start,
	roll,
	action,
	event,
	combat,
	turnend
}
currentphase = phase.start;
systemmessage = "";
eventcreate = false;




