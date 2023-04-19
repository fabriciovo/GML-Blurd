
if(!ds_map_exists(async_load,"type"))
	exit

if(!string_count("FirebaseFirestore",async_load[?"type"]))
	exit

var ins = instance_create_depth(0,0,0,Obj_Debug_FallText_Firestore)
ins.text = string(async_load[?"listener"]) + " - " + async_load[?"type"]  + " - " + async_load[?"path"] + " - " + string(async_load[?"status"])

if(ds_map_exists(async_load,"value"))
	ins.text += " -> " + string(async_load[?"value"])
	
if(ds_map_exists(async_load,"errorMessage"))
	ins.text += " -> " + string(async_load[?"errorMessage"])

if(async_load[?"status"] == 200)
	ins.color = c_white
else
	ins.color = c_red

//////////////////////
	
if(async_load[?"status"] == 200)//400: general error; 404: document not found; 401: Unauthenticated; 403: permission-denied; 409: already-exists
//if(async_load[?"listener"] == myListener)//comapre with your listener if you have one...
switch(async_load[?"type"])
{
	case "FirebaseFirestore_Document_Set":
		var path = async_load[?"path"]
	break

	case "FirebaseFirestore_Document_Update":
		var path = async_load[?"path"]
	break

	case "FirebaseFirestore_Document_Read":
		var _path = async_load[?"path"]
		var _value = async_load[?"value"]
		var _json = json_decode(_value);
		var _player =  o_player_controll;
		_player.coins = ds_map_find_value(_json, "coins");
		_player.coins_per_second = ds_map_find_value(_json, "coins_per_second");
		_player.total_coins = ds_map_find_value(_json, "total_coins");
		_player.ds_shop_items = ds_map_find_value(_json, "shop_items");
		//_player.craft_items = json_parse(ds_map_find_value(_json, "craft_items"));
		//_player.quests = json_parse(ds_map_find_value(_json, "quests"));
		//_player.secret_items = json_parse(ds_map_find_value(_json, "secret_items"));

		//_player.total_coins = ds_map_find_value(_json, "total_coins");
		//_player.track = json_parse( ds_map_find_value(_json, "track"));
		//_player.upgrades = json_parse(ds_map_find_value(_json, "upgrades"));
		ds_map_destroy(_json);
		



	break
	
	case "FirebaseFirestore_Document_Listener":
		var path = async_load[?"path"]
		value = async_load[?"value"]
	break

	case "FirebaseFirestore_Document_Delete":
		var path = async_load[?"path"]
	break
	
	case "FirebaseFirestore_Collection_Add":
		var path = async_load[?"path"]
	break
				
	case "FirebaseFirestore_Collection_Read":
		var path = async_load[?"path"]
		value = async_load[?"value"]
	break
	
	case "FirebaseFirestore_Collection_Listener":
		var path = async_load[?"path"]
		value = async_load[?"value"]
	break
			
	case "FirebaseFirestore_Collection_Query":
		var path = async_load[?"path"]
		value = async_load[?"value"]
	break
}