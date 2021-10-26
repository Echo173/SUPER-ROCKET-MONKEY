var yy = base_y

draw_set_halign(fa_center)

draw_text(base_x,yy,"Thanks for playing!")

yy += 24

var add_txt_s = ""
var add_txt_m = ""
if (global.secs < 10) add_txt_s = "0"
if (global.mins < 10) add_txt_m = "0"
var str = string(global.hrs) + ":" + add_txt_m + string(global.mins) + ":" + add_txt_s + string(global.secs)

draw_text(base_x,yy,"Time\n" + str)

yy += 30
str = string(global.death_count) + " Deaths"
draw_text(base_x,yy,str)

yy += 30
str = "Credits\n\nEli/ech0destr0yer/GreenBoxGames\n- Concept - Coding - Art - SoundFX -\n\nKai/MunkieBeets\n- Music -"
draw_text(base_x,yy,str)

yy += 96
str = "Special thanks to Otto for putting this Jam together!"
draw_text(base_x,yy,str)

draw_set_halign(fa_left)