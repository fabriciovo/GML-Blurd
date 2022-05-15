/// @description Insert description here
// You can write your code in this editor

coin_items_ = ds_list_create();
ds_list_add(coin_items_, new Cake());
ds_list_add(coin_items_, new Bottled_Drinks());


var _size = ds_list_size(coin_items_);
for(var i = 0; i < _size; i++){
	var _item = coin_items_[| i];
	var _obj = instance_create_layer(x,y /2 +  i * 38 ,"Shop",o_shop_container);
	var _level = global.coin_items[? _item.key_ ]
	_obj.sprite_ = _item.sprite_;	
	_obj.index_ = _item.index_;	
	_obj.name_ = _item.name_;
	_obj.key_ = _item.key_;
	_obj.level_ = _level;
	
	_obj.cost_ = _item.cost_  * _level * 3.3
	_obj.coins_per_second_ = _item.cost_ / 35;
}

layer_set_visible("Shop",false);

 
