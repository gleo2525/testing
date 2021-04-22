/// @description Insert description here
//var _up = keyboard_check_pressed(vk_pageup);
//var _down = keyboard_check_pressed(vk_pagedown);

switch(type){
	
	case events.shop:
	currentitem = ds_list_find_value(shopinventory,shoplist);
	//if (keyboard_check_released(vk_pageup) && shoplist > 0) {
	//	shoplist--;		
	//}
	//if(keyboard_check_released(vk_pagedown)&& shoplist < ds_list_size(shopinventory)-1){
	//	shoplist++;
	//}

	//if( keyboard_check_released(vk_space)) {
	//	Addinventory(currentitem);
	//}
	if(ds_grid_get(o_board.testgrid,o_player.playerx,o_player.playery) != 5) {
		o_backend.currentphase = phase.action;
		instance_destroy();
	}
	break;
	
	case events.church:
	// Save point		
		if(ds_grid_get(o_board.testgrid,o_player.playerx,o_player.playery) != 2) {
			o_backend.currentphase = phase.action;
			instance_destroy();
		}
		break;
	case events.deathtrap:
	// return to save point
		o_player.vitality = 0;
		if(ds_grid_get(o_board.testgrid,o_player.playerx,o_player.playery) != 3) {
			o_backend.currentphase = phase.action;
			instance_destroy();
		}
		break;
	case events.combat:
	//enter combat room
		draw_text(x,y,"In Combat");
		if(ds_grid_get(o_board.testgrid,o_player.playerx,o_player.playery) != 4) {
			o_backend.currentphase = phase.action;
			instance_destroy();
		}
		break;
	// Wizard
	case events.wizard:
		if(ds_grid_get(o_board.testgrid,o_player.playerx,o_player.playery) != 6) {
			o_backend.currentphase = phase.action;
			instance_destroy();
		}
		break;
	// teleport to final boss
	case events.finalboss: 
		type = noone;
		if(ds_grid_get(o_board.testgrid,o_player.playerx,o_player.playery) != 7) {
			o_backend.currentphase = phase.action;
		instance_destroy();
		}
		break;
}