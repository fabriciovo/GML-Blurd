// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function constructor_upgrade(_name, _key, _sprite,_price, _number, _type,_level) constructor {
	name = _name
	key = _key
	level = _level
	sprite = _sprite
	price = _price
	number = _number
	type = _type

		
	function_reward = function(){
		return {
			key: key,
			price: price,
			level: level,
			type: type,
			number: number,
			value: 0
		}
	}
	
	event_step = function(){
	
	}
	
}

function constructor_upgrade_unlockable(_name, _key, _sprite,_price, _number, _type,_level,_reward_type, _reward): constructor_upgrade(_name, _key, _sprite,_price, _number, _type,_level) constructor {
	reward = _reward;
	name = _name
	key = _key
	level = _level
	sprite = _sprite
	price = _price
	number = _number
	type = _type
	reward_type = _reward_type
	function_unlockable_reward = function(){		
		var _player_ds_list = o_player_controller
		switch(reward_type){
			case "food":
				_player_ds_list = o_player_controller.ds_foods
			break
			case "upgrade":
				_player_ds_list = o_player_controller.ds_upgrades
			break
			case "quest":
				_player_ds_list = o_player_controller.ds_quests
			break
		}

		unlockable_reward(
		_player_ds_list,
		reward.function_reward())
	}
}

function constructor_upgrade_food_cps(_name, _key, _sprite, _type, _price) constructor {
	name = _name
	key = _key
	level = 0
	sprite = _sprite
	price = _price
	type = _type

	function_unlockable_reward = function(){		
		o_player_controller.ds_foods[? key].coins_per_second *= 2;
	}
}
