/// @desc Draw stats for gameboard

// make sure to add an if statement that limits this to the board room
// Draw max vitality when damaged	
for (var maxvit = 0; maxvit < currentplayer.max_vitality; maxvit += 1) {	
	draw_sprite_ext(s_heart,0,((maxvit*75)+50),room_height/30,3,3,0,c_aqua,1);	
}
// draw vitality
 for (var vit = 0; vit < o_player.vitality; vit += 1) {
	draw_sprite_ext(s_heart,0,((vit*75)+50),room_height/30 ,3,3,0,c_white,1);	
}
	

// Draw Dice rolls in numbers
if(instance_exists(o_player)) {
	draw_set_font(f_publicdomainarial);
	draw_text(((maxvit*75)+50),room_height/30,"Dice Result: " + string(o_player.points)); 
	//item1 = o_player.inventory[|0][0];
	//item2 = o_player.inventory[|0][1];
	draw_text(((maxvit*75)+50)-150,room_height/30 + 50,"Munnies: " + string(o_player.munnies));
	draw_text(((maxvit*75)+50),room_height/30 + 50,"Inventory: " );
	for (var inven = 0; inven < ds_list_size(o_player.inventory); inven++) {
		draw_text(((maxvit*75)+120),room_height/30 + 50 + (25*(inven)), global.itemName[o_player.inventory[|inven][0]]);
		draw_text(((maxvit*75)+170),room_height/30 + 50 + (25*(inven)), o_player.inventory[|inven][1]);
	}
}


draw_text(room_width/2,room_height/6,systemmessage);
draw_text(room_width/2,room_height/5,string(o_player.playerx)+ ","+ string(o_player.playery));
draw_text(room_width/2,room_height/4,string(o_player.savepointx)+ ","+ string(o_player.savepointy));