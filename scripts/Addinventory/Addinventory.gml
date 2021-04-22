/// @arg item
function Addinventory(){
	item = argument0;
	is_added = false;
	for (i = 0; i < ds_list_size(o_player.inventory); i++) {
		if (o_player.inventory[|i][0] == item[0]) {
			o_player.inventory[|i][1] += item[1];
			is_added = true;
		}
	}
	if (is_added = false) {
		ds_list_add(o_player.inventory,item);	
	}
}
