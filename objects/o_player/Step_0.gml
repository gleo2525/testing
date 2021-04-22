/// @description Insert description here
// You can write your code in this editor

//right = keyboard_check_pressed(vk_right);
//left = keyboard_check_pressed(vk_left);
//up = keyboard_check_pressed(vk_up);
//down = keyboard_check_pressed(vk_down);
usepotion = keyboard_check_pressed(vk_tab);
damage = keyboard_check_pressed(vk_delete);
training = keyboard_check_pressed(ord("T"));


if (room == testroom) {
	x = room_width/4 + playerx * 32;
	y = room_height/4 + playery * 32;
	image_xscale = 0.5;
	image_yscale = 0.5;
}
//#region movement delete down event in final product
//if (points > 0) {
//// Move player 1 space to the right on grid
//	if (right) {
//		if (ds_grid_get(o_board.testgrid,playerx+1,playery)){
//			playerx += 1;
//			points -= 1;
//		}
//	}
//// Move player 1 space to the left on the grid
//	if (left) {
//		if (ds_grid_get(o_board.testgrid,playerx-1,playery)){
//		playerx -= 1;
//		points -= 1;
//		}
//	}
//// Move player 1 space above on the grid
//	if (up) {
//		if (ds_grid_get(o_board.testgrid,playerx,playery-1)){
//			playery -= 1;
//			points -= 1;
//		}
//	}
//// Move player 1 space below on the grid
//	if (down) {
//		if (ds_grid_get(o_board.testgrid,playerx,playery+1)){
//			playery += 1;
//			points -= 1;
//		}
//	}
//}
#endregion
#region Using items
if(usepotion) {
	for (i = 0; i < ds_list_size(inventory); i++)
		{
		if (inventory[|i][0] == item.potion && inventory[|i][1] > 0) {
			instance_create_layer(x,y,"Instances",o_item_parent);
		}
	}
}

if(damage && vitality > 0) {
	vitality--;
}
#endregion
// increase vitality for the cost of points
if(points = 6 && training && limit_vitality > max_vitality && o_backend.currentphase = phase.action) {
	points = 0;
	max_vitality++;	
	vitality++;
}