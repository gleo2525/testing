draw_set_font(f_publicdomainarial);

var i, j;
for (i = 0; i < ds_grid_width(testgrid); i += 1)
   {
   for (j = 0; j < ds_grid_height(testgrid); j += 1)
      {
      if ds_grid_get(testgrid, i, j) = 1
         {
         draw_text(room_width/4 + i * 32, room_height/4 + j * 32,"O");
         }
	if ds_grid_get(testgrid, i, j) = 2
         {
         draw_text(room_width/4 + i * 32, room_height/4 + j * 32,"C");
         }
	if ds_grid_get(testgrid, i, j) = 3
         {
         draw_text(room_width/4 + i * 32, room_height/4 + j * 32,"D");
         }
	if ds_grid_get(testgrid, i, j) = 4
         {
         draw_text(room_width/4 + i * 32, room_height/4 + j * 32,"X");
         }
	if ds_grid_get(testgrid, i, j) = 5
         {
         draw_text(room_width/4 + i * 32, room_height/4 + j * 32,"S");
         } 
	if ds_grid_get(testgrid, i, j) = 6
         {
         draw_text(room_width/4 + i * 32, room_height/4 + j * 32,"W");
         }
	if ds_grid_get(testgrid, i, j) = 7
         {
         draw_text(room_width/4 + i * 32, room_height/4 + j * 32,"7");
         }
		else {
			draw_text(room_width/4 + i * 32, room_height/4 + j * 32," ");
		}
      }
   }
   