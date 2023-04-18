// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init(){
	gml_pragma("global", "init()");
	
	enum ENUM_MATERIALS {
		SPIKE,
		FEATHER,
		SHELL
	}
	
	enum ENUM_SECRET_ITEMS {
		SKY_STONE
	}
	
	global.struct_shop_items = {
		cake: {
			key:"cake",
			name: "Cake",
			level:1,
			price: 1,
			coins_per_second: 0.1,
			sprite: s_item,
			mult: 1.1
		},
	}
	
	global.struct_upgrade_items = {
		speed_drink: {
			name:"Speed Drink",
			level:0,
			sprite: s_coin,
			price: 5,
			can_spawn: true,
			spawn_timer: 1,
			number:0,
			type: "Power Up",
			mult: 2
		},
		spike_head: {
			name:"Spike Head",
			level:0,
			price:1,
			number:0,
			can_spawn: true,
			spawn_timer: 1,
			type:"Monster",
			sprite: s_coin,
			mult: 1.3
		},
		snail: {
			name:"Snail",
			level:0,
			sprite: s_coin,
			number:1,
			price: 10,
			type:"Monster",
			can_spawn: true,
			spawn_timer: 1,
			mult: 1.3
		},
		angry_bird: {
			name:"Angry Bird",
			level:0,
			sprite: s_coin,
			number:2,
			price: 10,
			type:"Monster",
			can_spawn: true,
			spawn_timer: 1,
			mult: 1.3

		},
	}
	
	global.struct_quests = {
		five_coins: {
			name:"Five Coins",
			progress: {
				text: "Collect Coins: ",
				count:0,
				max_count:5
			},
			description: "",
			sprite: s_item,
			unlocked: false,
			condition: function(){
				var _track_value = o_player_controll.ds_collectables[? "coins"].value
				progress.count = _track_value
				if _track_value >= progress.max_count {
					var _reward_struct = variable_struct_get(global.struct_shop_items, "cake")
					var _reward = { 
							level: 1,
							price: _reward_struct.price
						}
					
					quest_reward(
					o_player_controll.ds_shop_items,
					_reward_struct.key,
					_reward,
					"five_coins")
				}
			}
		}
		//new_challenge: {
		//	name:"Ten Coins",
		//	progress: {
		//		text: "Collected Coins:",
		//		count:0,
		//		max_count:10
		//	},
		//	description: "",
		//	sprite: s_item,
		//	unlocked: false,
		//	condition: function(){
		//		var _track_value = o_player_controll.player.track.collectables.coins.value
		//		progress.count = _track_value
		//		if _track_value >= progress.max_count {
		//			quest_reward(
		//			o_player_controll.player.upgrades,
		//			global.struct_upgrade_items.spike_head,
		//			global.struct_quests.new_challenge)
		//		}
		//	}
		//},
		//new_challenge_2: {
		//	name:"Kill this Spikes",
		//	progress: {
		//		text: "Spike Heads: ",
		//		count:0,
		//		max_count:10
		//	},
		//	description: "",
		//	sprite: s_item,
		//	unlocked: false,
		//	condition: function(){
		//		var _track_value = o_player_controll.player.track.monsters.spike_head.value
		//		progress.count = _track_value
		//		if _track_value >= progress.max_count {
		//			quest_reward(
		//			o_player_controll.player.upgrades,
		//			global.struct_upgrade_items.snail,
		//			global.struct_quests.new_challenge_2)
		//		}
		//	}
		//},
		//new_challenge_3: {
		//	name:"New Challenges",
		//	progress: {
		//		text: "Spike Heads: ",
		//		count:0,
		//		max_count:50,
		//	},
		//	description: "",
		//	sprite: s_item,
		//	unlocked: false,
		//	condition: function(){
		//		var _track_value = o_player_controll.player.track.monsters.spike_head.value
		//		progress.count = _track_value
		//		if _track_value >= progress.max_count {
		//			quest_reward(
		//			o_player_controll.player.upgrades,
		//			global.struct_upgrade_items.angry_bird,
		//			global.struct_quests.new_challenge_3)
		//		}
		//	}
		//},
		//new_challenge_4: {
		//	name:"More Speed",
		//	progress: {
		//		text: "Collect Coins: ",
		//		count:0,
		//		max_count: 200
		//	},
		//	description: "",
		//	sprite: s_item,
		//	unlocked: false,
		//	condition: function(){
		//		var _track_value = o_player_controll.player.track.collectables.coins.value
		//		progress.count = _track_value
		//		if _track_value >= progress.max_count {
		//			quest_reward(
		//			o_player_controll.player.upgrades,
		//			global.struct_upgrade_items.speed_drink,
		//			global.struct_quests.new_challenge_4)
		//		}
		//	}
		//}
	}
		
	global.array_secret_items = [
		{
			name:"Sky Stone",
			description:"Open a portal to teleport you for bonus Stage",
			count: 0,
			sprite: s_item,
			craft_items: {
				spikes: 5,
				feather: 5,
				shell: 5
			},
			func: function(){
				room_goto(rm_bonus_stage_1)
			},
			craft: function() {
				var _player_craft_items = o_player_controll.ds_craft_items
				var _player_secret_items = o_player_controll.ds_secret_items
				
				var _spike = ds_list_find_value(_player_craft_items,ENUM_MATERIALS.SPIKE)
				var _feather = ds_list_find_value(_player_craft_items,ENUM_MATERIALS.FEATHER)
				var _shell = ds_list_find_value(_player_craft_items,ENUM_MATERIALS.SHELL)
				
				var _sky_stone = ds_list_find_value(_player_secret_items, ENUM_SECRET_ITEMS.SKY_STONE)
				
				show_message(_feather)
				
				if _spike >= craft_items.spikes  
				and _feather >= craft_items.feather  
				and _shell >= craft_items.shell 
				{
					_feather -= craft_items.spikes
					_feather -= craft_items.feather
					_shell -= craft_items.shell
					_sky_stone += 1
				}
			}
		}
	]
		
	global.array_craft_bag = [
		{
			name:"Spike",
			description: "",
			sprite: s_item,
			count: 0,
		},
		{
			name:"Bird Feather",
			description: "",
			sprite: s_item,
			count: 0,
		},
		{
			name:"Snail Hull",
			description: "",
			sprite: s_item,
			count: 0,
		}
	
	]


}