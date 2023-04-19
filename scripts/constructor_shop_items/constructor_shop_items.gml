function constructor_shop_item(_key, _width, _height) constructor {
	width = _width;
	height = _height;
	global_item = variable_struct_get(global.struct_shop_items,_key)
	item = o_player_controll.ds_shop_items[? _key]
	hover = 0
	l_click = 0
	open_panel = false
	color = c_green
		
	step_method = function(){
		if !object_exists(o_player_controll) exit
		var _player = o_player_controll
		
		if _player.coins >= item.price  {
			color = hover ? c_green : c_blue
			if hover and l_click {
				_player.coins -= item.price 
				_player.coins_per_second += global_item.coins_per_second
				item.level++
				item.price += item.price * global_item.mult
			}
			
		}else {
			color = c_red	
		}


	}
	end_step_method = function(){
		var _mouse_x = device_mouse_x_to_gui(0);
		var _mouse_y = device_mouse_y_to_gui(0);


		hover = point_in_rectangle(_mouse_x, _mouse_y, x,y , x + width, y + height);
		
		l_click = mouse_check_button_pressed(mb_left)
	}
	
	draw_gui_method = function(){
		var _margin = 4;
		var _scale = 2;
		var _size = 4;
		var _size_new = height - _margin * _size;

		var _spr = global_item.sprite;
		var _name = global_item.name;

		draw_set_color(color);
		draw_set_alpha(0.4);

		draw_rectangle(x  - 5 ,y,x + width, y + height, 0);

		draw_set_alpha(1);
		draw_set_color(c_white);

		draw_rectangle(x - 5 , y , x + width, y + height,1);

		draw_sprite_ext(_spr, 0, x + _margin + _size_new / 3 - 10, y + _margin + _size_new / 4,_scale,_scale,0,c_white,1);

		
		draw_set_font(fnt_shop_item);
		draw_text(x + _margin * 2 + _size_new, y + _margin + 2, _name);
		draw_text(x + _margin * 19 + _size_new, y + _margin + 2, "Lvl: " + string(item.level));
		draw_text(x + _margin * 2 + _size_new, y + _margin + 20, "Price: " + string(item.price));
		draw_text(x + _margin * 19 + _size_new, y + _margin + 20, "CpS: " + string(global_item.coins_per_second));
	}
	draw_gui_end_method = function(){}
}

function constructor_upgrade_item(_key, _width, _height) constructor {
	width = _width;
	height = _height;
	global_upgrade = variable_struct_get(global.struct_upgrade_items,_key)
	item = o_player_controll.ds_upgrades[? _key]
	hover = 0
	l_click = 0
	open_panel = false
	color = c_green

	
	step_method = function(){
		if !object_exists(o_player_controll) exit

		color = hover ? c_green : c_blue
		var _player = o_player_controll
		if hover and l_click and _player.coins >= item.price {
			_player.coins -= item.price 
			item.level++
			item.price += item.price * global_upgrade.mult
		}
		

	}
	end_step_method = function(){
		var _mouse_x = device_mouse_x_to_gui(0);
		var _mouse_y = device_mouse_y_to_gui(0);


		hover = point_in_rectangle(_mouse_x, _mouse_y, x,y , x + width, y + height);
		
		l_click = mouse_check_button_pressed(mb_left)
	}
	
	draw_gui_method = function(){
		var _margin = 4;
		var _scale = 2;
		var _size = 4;
		var _size_new = height - _margin * _size;

		var _spr = global_upgrade.sprite;
		var _name = global_upgrade.name;

		draw_set_color(color);
		draw_set_alpha(0.4);

		draw_rectangle(x,y,x + width, y + height, 0);

		draw_set_alpha(1);
		draw_set_color(c_white);

		draw_rectangle(x , y , x + width, y + height,1);

		draw_sprite_ext(_spr, 0, x + _margin + _size_new / 3 - 10, y + _margin + _size_new / 4,_scale,_scale,0,c_white,1);

		draw_set_font(fnt_shop_item);
		draw_text(x + _margin * 2 + _size_new, y + _margin + 2, _name);
		draw_text(x + _margin * 19 + _size_new, y + _margin + 2, "Lvl: " + string(item.level));
		draw_text(x + _margin * 2 + _size_new, y + _margin + 20, "Price: " + string(item.price));
		draw_text(x + _margin * 26 + _size_new, y + _margin + 20, "Type: " + string(global_upgrade.type));
	}
	draw_gui_end_method = function(){}

}

function constructor_quest_item(_key, _width, _height) constructor {
	width = _width;
	height = _height;
	item = variable_struct_get(global.struct_quests,_key)
	hover = 0
	l_click = 0
	open_panel = false
	color = c_green

	step_method = function(){
		if !object_exists(o_player_controll) exit
		if item.unlocked {
			color = c_green
		}else {
			color = c_black
		}
	}
	end_step_method = function(){
		var _mouse_x = device_mouse_x_to_gui(0);
		var _mouse_y = device_mouse_y_to_gui(0);
		hover = point_in_rectangle(_mouse_x, _mouse_y, x,y , x + width, y + height);
		l_click = mouse_check_button_pressed(mb_left)
	}
	
	draw_gui_method = function(){
		var _margin = 4;
		var _scale = 2;
		var _size = 4;
		var _size_new = height - _margin * _size;

		var _spr = item.sprite;
		var _name = item.name;
        var _progress = item.progress;
		draw_set_color(color);
		draw_set_alpha(0.4);

		draw_rectangle(x,y,x + width, y + height, 0);

		draw_set_alpha(1);
		draw_set_color(c_white);

		draw_rectangle(x , y , x + width, y + height,1);

		draw_sprite_ext(_spr, 0, x + _margin + _size_new / 3 - 10, y + _margin + _size_new / 4,_scale,_scale,0,c_white,1);

		draw_set_font(fnt_shop_item);
		draw_text(x + _margin * 2 + _size_new, y + _margin + 2, _name);
		draw_text(x + _margin * 2 + _size_new, y + _margin + 20, _progress.text + string(_progress.count) + " / " + string(_progress.max_count));
	}
   draw_gui_end_method = function(){}
}

function constructor_craft_bag_item(_index, _width, _height) constructor {
	width = _width;
	height = _height;
	index = _index;
	hover = 0
	l_click = 0
	open_panel = false
	color = c_white
	ds_list = o_player_controll.ds_craft_items

	step_method = function(){
		if !object_exists(o_player_controll) exit
		var _count = ds_list_find_value(ds_list,index)
		if _count > 0 {
			color = c_white
		}else{
			color = c_black
		}
	}
	end_step_method = function(){
		var _mouse_x = device_mouse_x_to_gui(0)
		var _mouse_y = device_mouse_y_to_gui(0)


		hover = point_in_rectangle(_mouse_x, _mouse_y, x,y , x + width, y + height)
		
		l_click = mouse_check_button_pressed(mb_left)
	}
	
	draw_gui_method = function(){
		var _margin = 4
		var _scale = 2
		var _size = 4
		var _size_new = height - _margin * _size

		var _spr = global.array_craft_bag[index].sprite
		var _name = global.array_craft_bag[index].name
		var _count = ds_list_find_value(ds_list,index)

		draw_set_color(color)
		draw_set_alpha(0.4)

		draw_rectangle(x,y,x + width, y + height, 0)

		draw_set_alpha(1)
		draw_set_color(c_white)

		draw_rectangle(x , y , x + width, y + height,1)

		draw_sprite_ext(_spr, 0, x + _margin + _size_new / 3 - 10, y + _margin + _size_new / 4,_scale,_scale,0,c_white,1);

		draw_set_font(fnt_shop_item)
		draw_text(x + _margin * 2 + _size_new, y + _margin + 2, _count)
	}
	draw_gui_end_method = function(){}
}

function constructor_secret_item (_index, _width, _height) constructor {
	width = _width;
	height = _height;
	index = _index;
	hover = 0
	l_click = 0
	open_panel = false
	color = c_white
	sprite_color = c_black
	ds_list = o_player_controll.ds_secret_items

	step_method = function(){
		if !object_exists(o_player_controll) exit
		var _count = ds_list_find_value(ds_list,index)
		var _item = global.array_secret_items[index];
		if _count > 0 {
			sprite_color = c_white
		}else{
			sprite_color = c_black
		}
		
		if hover and l_click {
			if _count > 0 {
				_item.count--;
				_item.func()
			}else if _count == 0 {
				_item.craft()
			}
		}
	}
	end_step_method = function(){
		var _mouse_x = device_mouse_x_to_gui(0);
		var _mouse_y = device_mouse_y_to_gui(0);

		hover = point_in_rectangle(_mouse_x, _mouse_y, x,y , x + width, y + height);
		
		l_click = mouse_check_button_pressed(mb_left)
		
	}
	
	draw_gui_method = function(){
		var _margin = 4;
		var _scale = 3;
		var _size = 4;
		var _size_new = height - _margin * _size;

		var _spr = global.array_secret_items[index].sprite;
		var _name = global.array_secret_items[index].name;
		var _count =  ds_list_find_value(ds_list,index)
		
		draw_set_color(color);
		draw_set_alpha(0.4);

		draw_rectangle(x,y,x + width, y + height, 0);

		draw_set_alpha(1);
		draw_set_color(c_white);

		draw_rectangle(x , y , x + width, y + height,1);

		draw_sprite_ext(_spr, 0, x + _margin + _size_new / 4 - 2, y + _size_new / 4,_scale,_scale,0,sprite_color,1);

		draw_set_font(fnt_shop_item);
		draw_text(x + _margin * 2 + _size_new, y , string(_count));
	}
	
	draw_gui_end_method = function(){
		if hover {
			var _size = 200;
			var _margin = 4;
	
			var _cell_size = _size + _margin;		
			var _spr = s_solid;
	
			var _x = device_mouse_x_to_gui(0);
			var _y = device_mouse_y_to_gui(0);
	
			draw_set_color(c_dkgray);
			draw_rectangle(_x, _y, _x + _cell_size, _y + _cell_size,0);
			draw_set_color(c_white);
			draw_rectangle(_x, _y, _x + _cell_size, _y + _cell_size,1);

		    draw_text(_x + _cell_size + _cell_size * 0.8, _y + _cell_size * 0.7, "TEXT");
		
			
		}
	}
}