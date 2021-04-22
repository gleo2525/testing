/// @desc


if(type = events.shop) {
	draw_text(200,400,"Shop Inventory: " );
	for (var inven = 0; inven < ds_list_size(shopinventory); inven++) {
		draw_text(350,400 + (25*(inven)), global.itemName[shopinventory[|inven][0]]);
		// Below shows the number of items in the shop if needed
		 draw_text(400,400 + (25*(inven)), shopinventory[|inven][2]);
		//TODO: set strings to align based on string_height
		//x1 = x of shop Inventory -5 + 350, y1 = y of shop inventory 400
		draw_rectangle(345,400 + (25*(shoplist)),355+string_width(global.itemName[currentitem[0]]),400+ (25*(shoplist))+string_height(global.itemName[currentitem[0]]),true);
		//draw_rectangle(string_width("Shop Inventory: "),400 + (25*(shoplist)),355+string_width(global.itemName[currentitem[0]]),400+ (25*(shoplist))+string_height(global.itemName[currentitem[0]]),true);
	}
	draw_text(150,600,global.itemName[currentitem[0]]);
	draw_text(150,700,shoplist);
} 