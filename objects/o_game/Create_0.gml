/// @description Insert description here
// You can write your code in this editor
global.one_second = game_get_speed(gamespeed_fps);
global.game_speed = -1;

global.coins = 0;
global.coins_per_second = 0;

global.coin_items = {
	cake: new Cake(),
	bottled_drinks : new Bottled_Drinks(),
}


global.upgrade_items = {
	speed_drink: new Speed_Drink(),
	
}

global.characters = {
blurd: o_blurd,
}

