/// @description Insert description here
// You can write your code in this editor
 #region old_player_stats
//player = {
//	total_coins: 0,
//	coins:0,
//	coins_per_second: 0,

//	craft_items:{
//		spike_head_material:0,
//		feather_material:0,
//		shell_material:0,
//	},
//	quests: {
	
//	},
//	secret_items: {
//		sky_stone:0,
//	},
//	upgrades: {

//	},
//	shop_items: {},
//	collectables: {
//		coins:{
//			value:0,
//		}
//	},
//	monsters:{
//		spike_head:{
//			value:0,
//			level:0,
//		},
//		snail:{
//			value:0,
//			level:0,
//		},
//		angry_bird:{
//			value:0,
//			level:0,
//		},
//	},
//	powerups:{
//		speed_drink:{
//			value:0,
//			level:0
//		},
//	}
	
//}

#endregion


first_login = false
beta_tester = false
coins = 0
total_coins = 0
coins_per_second = 0
coins_out_game = 0
last_date_time = ""
ds_foods = ds_map_create()
ds_quests = ds_map_create()
ds_quests_completed = ds_map_create()
ds_upgrades = ds_map_create()
ds_tracker = ds_map_create()
ds_secret_items = ds_map_create()
ds_craft_items = ds_map_create()



firebase_create()

add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)
add_food(global.struct_foods.candy)

alarm[1] = 500