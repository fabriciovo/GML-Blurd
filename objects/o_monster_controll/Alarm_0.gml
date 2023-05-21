/// @description Spawn Monsters
var _list = o_player_controll.ds_upgrades
var _list_items_values = ds_map_values_to_array(_list)
var _list_items_values_size = array_length(_list_items_values)

for(var _i = 0; _i < _list_items_values_size; _i++) {
	if _list_items_values[_i].type == "Monster" {
		switch(_list_items_values[_i].key) {
		case "spike_head":
			if f_random_chance(.8) {
				instance_create_layer(
				o_spawn_point.x,
				o_spawn_point.y,
				"Instances", 
				o_monster, 
				new constructor_monster_spike_head())
			}
		break;
		}
	}
}

alarm[0] = random_range(1,5) * global.one_second