// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function item_reward(_player_ds_list, _reward_key, _reward){
	ds_map_add(_player_ds_list,_reward_key, _reward)	
	instance_create_layer(global.VW / 2,50,"Instances", o_quest_ui, new quest_ui("nice", s_item))
}