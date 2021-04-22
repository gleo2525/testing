/// @desc player stats and whatnot
/// @desc player stats
// Clean up points references

points = 0
vitality = 6;
max_vitality = 6;
limit_vitality = 999;

strength = 1;
limit_strength = 999;

playerx = 5;
playery = 19;

points = 0;
munnies = 573;

inventory = ds_list_create();

savepointx = 5;
savepointy = 19;

ds_list_add(inventory,[item.sword,0]);
ds_list_add(inventory,[item.potion,0]);
ds_list_add(inventory,[item.shield,0]);
ds_list_add(inventory,[item.dice,0]);

// Check if it's player's turn
myturn = false;