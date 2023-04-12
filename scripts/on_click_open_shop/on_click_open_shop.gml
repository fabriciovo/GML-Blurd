function create_itens_shop(){
	var _items_layer = layer_get_id("Items")	
	var _sep = 4;

	var _x = 0;
	var _y = 120;

	var _w = 256;
	var _h = 54;
	var _x = 54;
	
	var _y = _y + _sep;

	var _list_items_size = array_length(o_player_controll.player.shop_items)
	for (var _i = 0; _i < _list_items_size; _i++) {
		var _item = o_player_controll.player.shop_items[_i]
		instance_create_layer(_x,_y,_items_layer,o_shop_item, new Item_UI(_item,_i,_w,_h));

		_y += (_h + _sep);
		
	}
	
}

function create_upgrade_shop(){
	var _upgrade_layer = layer_get_id("Upgrades")
	var _sep = 6;

	var _x = 0;
	var _y = 120;

	var _w = 256;
	var _h = 54;
	var _x = 54;
	
	var _y = _y + _sep;
	var _list_upgrades_size = array_length(o_player_controll.player.upgrades)
	for (var _i = 0; _i < _list_upgrades_size; _i++) {
	var _item = o_player_controll.player.upgrades[_i]
	instance_create_layer(_x,_y,_upgrade_layer,o_shop_item, new Item_Upgrade_UI(_item,_i,_w,_h));

	_y += (_h + _sep);
		
	}
}

function create_achievement_shop(){
	var _upgrade_layer = layer_get_id("Quest")
	var _sep = 6;

	var _x = 0;
	var _y = 120;

	var _w = 256;
	var _h = 54;
	var _x = 54;
	
	var _y = _y + _sep;
	var _player_quests = o_player_controll.player.quests
	var _array_quest_size = variable_struct_names_count(global.quests)
	var _keys = variable_struct_get_names(global.quests);
	for (var _i = array_length(_keys)-1; _i >= 0; --_i) {
		var _k = _keys[_i];
		var _quest = variable_struct_get(global.quests, _k);
		instance_create_layer(_x,_y,_upgrade_layer,o_shop_item, new Item_Quest_UI(_quest,_i,_w,_h));
		_y += (_h + _sep);
	}
	
}

function create_craft_bag(){
		var _layer = layer_get_id("Craft_Bag")
		var _size = array_length(o_player_controll.player.craft_items)
		var _margin = 24;
		var _sep = 6;
		var _cell_size = 40;

		var _size_x = 6;
		var _size_y = 2;

		var _inv_x = _margin + 21;
		var _inv_y = 118;

		var _x = 0;
		var _y = 0;
		
		

	for (var _i = 0; _i < 3; _i++ ){
		var _button_x = _inv_x + (_sep + _cell_size) * _x;
		var _button_y = _inv_y + (_sep + _cell_size) * _y;

		var _button = instance_create_layer(_button_x, _button_y, _layer, o_shop_item, new Item_Craftbag_UI(_i,40,40) );
		
		_x++;
	
		if (_x == _size_x) {
			_x = 0;
			_y++;
		}
	}	
}

function create_secret_items(){
		var _layer = layer_get_id("Inventory")
		var _size = array_length(global.secret_items)
		var _margin = 24;
		var _sep = 32;
		var _cell_size = 60;

		var _size_x = 3;
		var _size_y = 2;

		var _inv_x = _margin + 24;
		var _inv_y = 118;

		var _x = 0;
		var _y = 0;
		


	for (var _i = 0; _i < _size; _i++ ){
		var _x = _inv_x + (_sep + _cell_size) * _x;
		var _y = _inv_y + (_sep + _cell_size) * _y;

		instance_create_layer(_x, _y, _layer, o_shop_item, new Item_Secret_UI(global.secret_items[_i],_i,80,80) );
		
		_x++;
	
		if (_x == _size_x) {
			_x = 0;
			_y++;
		}
	}	
}




function on_click_open_shop(){
var _shop_layer = layer_get_id("Shop")
var _value = layer_get_visible(_shop_layer)

if _value == false {
	create_itens_shop()
	layer_set_visible("Items", true)
	instance_create_depth(70,global.VH - 150,0,o_btn_item, new btn_tab("Items", s_shop_icon_placeholder, create_itens_shop,o_player_controll.player.shop_items))
	instance_create_depth(110,global.VH - 150,0,o_btn_item, new btn_tab("Upgrades", s_shop_icon_placeholder,create_upgrade_shop,o_player_controll.player.upgrades))
	instance_create_depth(150,global.VH - 150,0,o_btn_item, new btn_tab("Quest", s_shop_icon_placeholder, create_achievement_shop,o_player_controll.player.quests))
	instance_create_depth(190,global.VH - 150,0,o_btn_item, new btn_tab("Craft_Bag", s_shop_icon_placeholder, create_craft_bag,o_player_controll.player.craft_items))
	instance_create_depth(230,global.VH - 150,0,o_btn_item, new btn_tab("Inventory", s_shop_icon_placeholder, create_secret_items,o_player_controll.player.secret_items))
}else{
	instance_destroy(o_shop_item)
	instance_destroy(o_btn_item)
}
	
layer_set_visible(_shop_layer, !_value)

}


