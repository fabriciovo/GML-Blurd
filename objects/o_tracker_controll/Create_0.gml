var _player_quests_lenght = array_length(o_player_controll.player.quests)
if _player_quests_lenght == 0 exit

var _array_quests_size = variable_struct_names_count(global.quest)
var _keys = variable_struct_get_names(global.quest);
for (var _i = array_length(_keys)-1; _i >= 0; --_i) {
	var _k = _keys[_i]
	var _quest = variable_struct_get(global.quest, _k)
	var _player_quests = o_player_controll.player.quests
	for(var _n = 0; _n < _player_quests_lenght; _n++){
		if(_player_quests[_n].name == _quest.name ){
			_quest.unlocked = true
		}
	}
}
	
	
	
