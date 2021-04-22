testgrid = ds_grid_create(10,20);
// center path
ds_grid_set_region(testgrid,5,19,5,0,1);

// left branch x-axis
ds_grid_set_region(testgrid,2,15,5,15,1);

//left branch y-axis
ds_grid_set_region(testgrid,2,15,2,0,1);

//right branch x-axis
ds_grid_set_region(testgrid,5,15,8,15,1);

// left branch y-axis
ds_grid_set_region(testgrid,8,15,8,0,1);

// Event tile case 2: Save point church
ds_grid_set(testgrid,5,12,2);

// Event tile case 3: Kills player to test respawn Death (Trap)
ds_grid_set(testgrid,8,12,3);

//// Set combat space
//randomize();
//ds_grid_set(testgrid,5,irandom_range(0,14),4);

// Currently Case 5: shop
ds_grid_set(testgrid,2,12,5);

// Event tile case 6: Wizard Tower: Reveal stuff on map
ds_grid_set(testgrid,5,10,6);

//// Event tile case 7:
//ds_grid_set(testgrid,5,9,7);

// TO the final boss
for (i = 0; i < ds_grid_width(testgrid); i++){
	if (ds_grid_get(testgrid,i,0) = 1){
		ds_grid_set(testgrid,i,0,7);
	}
}
