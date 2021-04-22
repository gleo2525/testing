//
grid1 = o_board.testgrid;
playerx = o_player.playerx;
playery = o_player.playery;

enum events {
	shop,
	church,
	combat,
	wizard,
	deathtrap,
	finalboss
}

type = noone;
tile = ds_grid_get(grid1,playerx,playery);

switch(tile) {
	case 2:
	// Save point Set up this way to ensure that the phases work correctly
		type = events.church;
		o_player.savepointx = o_player.playerx;
		o_player.savepointy = o_player.playery;
	//if(ds_grid_get(o_board.testgrid,o_player.playerx,o_player.playery) != 2) {
		//	o_backend.currentphase = phase.action;
		
	//}
		break;
	case 3:
	// return to save point
		type = events.deathtrap;
		break;
	case 4:
	//enter combat room
		type = events.combat;
		break;
	case 5: 
	// Show shop
		type = events.shop;
		shopinventory = ds_list_create();
		// Get rid of numbers from shop inventory
		ds_list_add(shopinventory,[item.sword,1,1]);
		ds_list_add(shopinventory,[item.potion,1,2]);
		ds_list_add(shopinventory,[item.shield,1,3]);
		ds_list_add(shopinventory,[item.dice,1,4]);
		shoplist = 0;
		currentitem = ds_list_find_value(shopinventory,shoplist);
		break;
	// Wizard
	case 6:
		type = events.wizard;
		break;
	// teleport to final boss
	case 7: 
		type = events.finalboss;
		break;
}

