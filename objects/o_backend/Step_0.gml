/// @desc create more dice when the instance is destroyed
#region key controls
right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
select = keyboard_check_pressed(vk_enter);
cancel = keyboard_check_pressed(vk_backspace);
pause = keyboard_check_pressed(vk_escape);

//rolldice = keyboard_check(vk_space);
//destroydice = keyboard_check_pressed(vk_space);
//diceletgo = keyboard_check_released(vk_space);


#endregion
#region Player Death
	if (o_player.vitality = 0) {
		o_player.playerx = o_player.savepointx;
		o_player.playery = o_player.savepointy;
		o_player.vitality = o_player.max_vitality;
		o_player.points = 0;
	}
#endregion
#region Player Turn Phases
switch (currentphase){
	case phase.start:
	 	
		systemmessage = "player 1's turn press ENTER to move phase";
		if(select)  {
			currentphase = phase.roll;	
		}
		break;
	case phase.roll:
		systemmessage = "fate lies is in your hand press ENTER to roll dice"
		if (select){
			if (o_player.points == 0 && !instance_exists(o_dice2)){
				instance_create_layer(room_width/2,room_height/2,"Instances",o_dice2);
			}
		}
		if(instance_exists(o_dice2)) {
			if (keyboard_check(vk_enter)) {	
				o_dice2.image_index = irandom(5);
			} 

			if (keyboard_check_released(vk_enter)) {
						o_dice2.roll = o_dice2.image_index + 1;	
						o_player.points += o_dice2.roll;
						instance_destroy(o_dice2);
			}	
		}
		if(o_player.points > 0) {
			currentphase = phase.action;	
		}
		break;
	case phase.action:
		systemmessage = "Action phase";
		if(ds_grid_get(o_board.testgrid,o_player.playerx,o_player.playery) = 1) {
			eventcreate = false;
		}
		if(o_player.points = 0) {
			currentphase = phase.turnend;	
		}
		#region Player movement
		
		if (o_player.points > 0 && !instance_exists(o_events)) {
		
	// Move player 1 space to the right on grid
		if (right) {
			if (ds_grid_get(o_board.testgrid,o_player.playerx+1,o_player.playery)){
				o_player.playerx += 1;
				o_player.points -= 1;
			}
		}
	// Move player 1 space to the left on the grid
		if (left) {
			if (ds_grid_get(o_board.testgrid,o_player.playerx-1,o_player.playery)){
				o_player.playerx -= 1;
				o_player.points -= 1;
			}
		}
	// Move player 1 space above on the grid
		if (up) {
			if (ds_grid_get(o_board.testgrid,o_player.playerx,o_player.playery-1)){
				o_player.playery -= 1;
				o_player.points -= 1;
			}
		}
	// Move player 1 space below on the grid
		if (down) {
			if (ds_grid_get(o_board.testgrid,o_player.playerx,o_player.playery+1)){
				o_player.playery += 1;
				o_player.points -= 1;
			}
		}
	}
		#endregion
		if(ds_grid_get(o_board.testgrid,o_player.playerx,o_player.playery) != 1  && eventcreate = false && o_player.points > 0){
						currentphase = phase.event;
			instance_create_layer(x,y,"Instances",o_events);
		}
		break;
	case phase.event:
		systemmessage = "phase.event";
		eventcreate = true;
		if(o_player.points = 0) {
			currentphase = phase.turnend;	
		}
		if(o_events.type = events.shop){
			if(up && o_events.shoplist > 0) {
				o_events.shoplist--;		
				}
			if(down && o_events.shoplist < ds_list_size(o_events.shopinventory)-1){
				o_events.shoplist++;
				}
			if(select && o_player.munnies >= o_events.currentitem[2]) {
				Addinventory(o_events.currentitem);
				o_player.munnies -= o_events.currentitem[2];
				}	
			if(cancel){
				currentphase = phase.action;
				instance_destroy(o_events);
				}
			}
	
		break;
	case phase.combat:
		systemmessage = "The wheel of fake is turning";
		if(select) {
			currentphase = phase.turnend;	
		}
		break;
	case phase.turnend:
		systemmessage = "you're done";
		eventcreate = false;
		ds_queue_enqueue(queue,currentplayer);
		currentplayer = ds_queue_dequeue(queue);
		if(select) {
			currentphase = phase.start;	
		}
		break;
}
#endregion