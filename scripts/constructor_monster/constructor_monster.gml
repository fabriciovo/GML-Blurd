function constructor_monster() constructor {	
	level = 0
	drop = []
	grav = 0
	vsp = 0
	jump = 0
	hsp = global.game_speed
	grounded = false
	track_key = ""
	image_speed = 0
	image_xscale = 1.2
	image_yscale = 1.2
	create_method = function(){
		show_error("METHOD NOT IMPLEMENTED",true)
	}
	step_method = function(){
		apply_gravity()
		x += hsp
	}
	end_step_method = function(){
		if(x <= -sprite_width){
			instance_destroy();
		}
	}
	destroy_method = function(){
		instance_create_layer(x,y,"Instances",o_particle, new Particles(s_explosion))
	}
	event_method = function(){
		show_error("METHOD NOT IMPLEMENTED",true)
	}
	alarm_method = function(){
		show_error("METHOD NOT IMPLEMENTED",true)
	}
	player_collision = function(){	
		if level > 10 { 
			var _chance = level / 100
			if f_random_chance(_chance) {
				var _drop_size = array_length(drop);
				var _drop_index = random_range(0, _drop_size);
				instance_create_layer(x,y - 20, "Instances",o_pickup,new drop[_drop_index]())
			}
		}
		instance_destroy()
	}
}
function constructor_monster_spike_head() : constructor_monster() constructor {
	sprite_index = s_spike_head
	image_speed = 0

	track_key = "spike_head"
	level = o_player_controller.ds_upgrades[? track_key].level
	
	create_method = function(){
		grav = 0.1
		jump = -6
		image_index = 0
		alarm[0] = random(3) * (global.one_second / 2)
		
		if level > 10 {
			array_push(drop, constructor_pickup_apple);
		}
		if level > 50 {
			array_push(drop, constructor_pickup_spike);
		}

	}
	
	player_collision = function(){
		o_player_controller.ds_tracker[? "monsters"].spike_head++ 
		o_player_controller.ds_tracker[? "monsters"].eliminations++ 
		instance_destroy()
	}
	
	alarm_method = function(){
		vsp = jump
	}
		
	event_method = function(){
		if grounded {
			image_index = 0
		}else{ 
			image_index = 1	
		}
	}
}
function constructor_monster_snail() : constructor_monster() constructor {
	sprite_index = s_snail
	
	track_key = "snail"
	level = o_player_controller.ds_upgrades[? track_key].level
	create_method = function(){
		hp = 3
		grav = 0.2
		jump = 0
		shield = false
		image_index = 0
		alarm[0] = random(2) * (global.one_second / 2)
		
		if level > 10 {
			array_push(drop, constructor_pickup_apple);
		}
		if level > 50 {
			array_push(drop, constructor_pickup_shell);
		}
	}
	
	alarm_method = function(){
		shield = true
	}
	
	player_collision = function() {
		if shield {
			hp -= 1
			hsp = random_range(1,3)
			vsp = random_range(-3,-6)
		}else{
			hp = 0
		}
	}
	
	event_method = function(){
		if !shield {
			image_index = 0
		}else{ 
			image_index = 1	
		}
		
		if grounded {
			hsp = global.game_speed 
		}
		
		if vsp < 0 {
			image_angle -= 33
		}else {
			image_angle = 0
		}
		
		if hp <= 0 {
			

			if level > 10 {
				var _drop_size = array_length(drop);
				var _drop_index = random_range(0, _drop_size);
				instance_create_layer(x,y ,"Instances",o_pickup,new drop[_drop_index]())
			}
				//instance_create_layer(x,y,"Instances",o_pickup, new Apple())
				o_player_controller.ds_tracker[? "monsters"].snail++ 
				o_player_controller.ds_tracker[? "monsters"].eliminations++ 
				instance_destroy()
			}
	}
}
function constructor_monster_angry_bird() : constructor_monster() constructor {
	sprite_index = s_fly
	image_speed = 0

	hsp = global.game_speed
	track_key = "angry_bird"
	
	level = o_player_controller.ds_upgrades[? track_key].level
	
	create_method = function(){
		grav = 0.3
		jump = -7
		image_index = 0
		alarm[0] = (global.one_second / 6)
		
		if level > 3 {
			array_push(drop, constructor_pickup_apple);
		}
		if level > 5 {
			array_push(drop, constructor_pickup_feather);
		}
	}
	
	player_collision = function(){
		o_player_controller.ds_tracker[? "monsters"].angry_bird++ 
		o_player_controller.ds_tracker[? "monsters"].eliminations++ 
		instance_destroy()
	}
	
	
	alarm_method = function(){
		vsp = jump
		alarm[0] = 45
	}
	
	event_method = function(){

	}
}



