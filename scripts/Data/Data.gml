enum SAVEDATA
{
	CHECKPOINTINDEX = 0,
	CHECKPOINTROOM = 1,
	TIMERSECS = 2,
	TIMERMINS = 3,
	TIMERHRS = 4,
	DOOROPENED = 5,
	FINALHASPLAYED = 6,
	DEATHCOUNT = 7,
}

enum SETTINGSDATA
{
	VOLUMESOUND = 0,
	VOLUMEMUSIC = 1,
	SHOWTIMER = 2
}

//Save game funciton
function save_game()
{
	//Create save array
	var _save_data;
	_save_data[SAVEDATA.CHECKPOINTINDEX] = global.checkpoint
	_save_data[SAVEDATA.CHECKPOINTROOM] = global.checkpoint_room
	
	_save_data[SAVEDATA.TIMERSECS] = global.secs
	_save_data[SAVEDATA.TIMERMINS] = global.mins
	_save_data[SAVEDATA.TIMERHRS] = global.hrs
	
	_save_data[SAVEDATA.DOOROPENED] = global.final_door
	_save_data[SAVEDATA.FINALHASPLAYED] = global.final_has_played
	
	_save_data[SAVEDATA.DEATHCOUNT] = global.death_count
	
	//Write to Json
	var _string = json_stringify(_save_data);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "SRM_savedata.save");
	
	buffer_delete(_buffer);
}

//Load game funciton
function load_game()
{
	//Create save array
	if (file_exists("SRM_savedata.save"))
	{
		var _buffer = buffer_load("SRM_savedata.save");
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		var _load_data = json_parse(_string);
		
		global.tutorial_stage = 8
		
		global.is_respawn = true
		
		global.checkpoint = _load_data[SAVEDATA.CHECKPOINTINDEX]
		
		global.secs = _load_data[SAVEDATA.TIMERSECS]
		global.mins = _load_data[SAVEDATA.TIMERMINS]
		global.hrs = _load_data[SAVEDATA.TIMERHRS]
		
		global.final_door = _load_data[SAVEDATA.DOOROPENED]
		global.final_has_played = _load_data[SAVEDATA.FINALHASPLAYED]
	
		global.death_count = _load_data[SAVEDATA.DEATHCOUNT]
		
		global.is_load = true
		
		var _r = instance_create_layer(x,y,layer,obj_fade_out)
		_r.room_target = _load_data[SAVEDATA.CHECKPOINTROOM]
		clicked_anim = true
	}
}

//Save audio settings
function save_settings()
{	
	if !(IS_HTML5)
	{
		//Create save array
		var _save_data;
		_save_data[SETTINGSDATA.VOLUMESOUND] = global.sound_volume_index
		_save_data[SETTINGSDATA.VOLUMEMUSIC] = global.music_volume_index
		_save_data[SETTINGSDATA.SHOWTIMER] = global.show_timer
	
		//Write to Json
		var _string = json_stringify(_save_data);
		var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	
		buffer_write(_buffer, buffer_string, _string);
		buffer_save(_buffer, "SRM_settingsdata.save");
	
		buffer_delete(_buffer);
	}
}	

//Load Audio Settings
function load_settings()
{
	if !(IS_HTML5)
	{
		if (file_exists("SRM_settingsdata.save"))
		{
			var _buffer = buffer_load("SRM_settingsdata.save");
			var _string = buffer_read(_buffer, buffer_string);
			buffer_delete(_buffer);
		
			var _load_data = json_parse(_string);
		
			global.sound_volume_index = _load_data[SETTINGSDATA.VOLUMESOUND]
			global.music_volume_index = _load_data[SETTINGSDATA.VOLUMEMUSIC]
			global.show_timer = _load_data[SETTINGSDATA.SHOWTIMER]
		}
	}
}