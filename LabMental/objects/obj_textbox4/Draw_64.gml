// Draw the box
draw_sprite_stretched(sprite_index, 0, x, y, width4, height4);

var draw_text_x4 = x;
var draw_text_y4 = y;
var draw_text_width4 = text_width4;

var finished4 = text_progress4 == text_length4;

// Portrait
if (sprite_exists(portrait_sprite4)) {
	// Shrink text width by the width the portrait will take up
	draw_text_width4 -= portrait_width4 + portrait_x4 + padding4 * 6;
	
	var draw_portrait_x4 = x + portrait_x4;
	var draw_portrait_y4 = y + portrait_y4;
	var draw_portrait_xscale4 = 1;
	
	// What side is the portrait on?
	if (portrait_side4 == PORTRAIT_SIDE4.LEFT4) {
		// Shift the text over when the portrait is on the left
		draw_text_x4 += portrait_width4 + portrait_x4 + padding4 * 6;
	}
	else {
		// Shift the portrait itself over when it is on the right
		draw_portrait_x4 = x + width4 + portrait_width4 + portrait_x4 - 200;
		draw_portrait_xscale4 = -1;
	}
	
	// Draw portrait backing
	draw_sprite(spr_portrait, 0, draw_portrait_x4, draw_portrait_y4);
	
	// Animate the portrait when typing
	var subimg4 = 0;
	if (!finished4)
		subimg4 = (text_progress4 / text_speed4) * (sprite_get_speed(portrait_sprite4) / game_get_speed(gamespeed_fps));
		
	draw_sprite_ext(portrait_sprite4, subimg4,
		draw_portrait_x4 + portrait_width4 / 10, draw_portrait_y4 + portrait_height4 / 8,
		draw_portrait_xscale4, 1, 0, c_white, 1);
}

// Speaker
if (speaker_name4 != "") {
	// Expand the nameplate if the name is wider than the default width
	var name_w = max(string_width(speaker_name4), speaker_width4);
	
	draw_sprite_stretched(spr_name, 0, x + speaker_x4, y + speaker_y4 - speaker_height4 / 2, name_w, speaker_height4);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(speaker_font4);
	draw_set_color(speaker_color4);
	draw_text(x + speaker_x4 + name_w / 2, y + speaker_y4, speaker_name4);
}

// Text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font4);
draw_set_color(text_color4);
type(draw_text_x4 + text_x4, draw_text_y4 + text_y4, text4, text_progress4, draw_text_width4);