/// @desc

switch (type) {
	case item.potion:
		if(o_player.vitality < o_player.max_vitality){
			o_player.vitality++
			
			for (var i = 0; i < ds_list_size(o_player.inventory); i++){
				if(o_player.inventory[|i][0] = item.potion) {
					o_player.inventory[|i][1]--;
				}
			}
			instance_destroy();
		} else {
			instance_destroy();	
		}
		break;
}