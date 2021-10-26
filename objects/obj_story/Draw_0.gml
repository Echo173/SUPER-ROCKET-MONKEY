var draw_ypos = ypos - string_height("A")
var draw_xpos = base_x

var pos = 1
var _init = 0
var _break_pos = 0

var max_width = room_width/2 + 32

function char_get_random()
{
	var _rstr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890"
	_rchar = string_copy(_rstr,irandom(string_length(_rstr)),1)
	return _rchar;
}

while (draw_ypos < room_height)
{
	if (pos > string_length(mtxt)) {
		break;
	}
	
	if (_init = 0)
	{
		_init = 1
		
		draw_ypos += string_height("A")
		draw_xpos = base_x
		
		var found = false
		var searchpos = pos
		var last_space_pos = pos
		
		while (found = false)
		{
			searchpos += 1
			var _tchar = string_char_at(txt,searchpos)
			
			if (_tchar = " ") {
				last_space_pos = searchpos + 1
			}
			
			if (_tchar = ".") {
				_break_pos = searchpos + 1
				found = true
				break;
			}
			
			var _checkstr = string_copy(txt,pos,searchpos - pos)
			if (string_width(_checkstr) > max_width)
			{
				_break_pos = last_space_pos
				found = true
				break;
			}
		}
		
		var _lengthstr = string_copy(txt,pos,_break_pos - pos)
		draw_xpos = base_x - string_width(_lengthstr)/2 - string_width(" ")
	}
	
	if (draw_ypos > -10) 
	{
		var tdist = draw_ypos - translate_pos
		if (abs(tdist) < 4)
		{
			var checkchar = string_char_at(mtxt,pos)
			if (checkchar != " ") && (checkchar != ".")
			{
				var char = char_get_random()
			}
			else
			{
				var char = string_char_at(mtxt,pos)
			}
		}
		else
		{
			if (tdist > 0)
			{
				var char = string_char_at(mtxt,pos)
			}
			else
			{
				var char = string_char_at(txt,pos)
			}
		}
		draw_text(draw_xpos,draw_ypos,char)
		draw_xpos += string_width(char)
	}
	
	pos += 1
	if (pos = _break_pos)
	{
		_init = 0
	}
}