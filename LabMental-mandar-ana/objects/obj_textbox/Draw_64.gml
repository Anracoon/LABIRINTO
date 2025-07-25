// Draw the box
draw_sprite_stretched(sprite_index, 0, x, y, width, height);

var draw_text_x = x;
var draw_text_y = y;
var draw_text_width = text_width;

var finished = text_progress == text_length;

// Portrait
if (sprite_exists(portrait_sprite)) {
	// Shrink text width by the width the portrait will take up
	draw_text_width -= portrait_width + portrait_x + padding * 6;
	
	var draw_portrait_x = x + portrait_x;
	var draw_portrait_y = y + portrait_y;
	var draw_portrait_xscale = 1;
	
	// What side is the portrait on?
	if (portrait_side == PORTRAIT_SIDE.LEFT) {
		// Shift the text over when the portrait is on the left
		draw_text_x += portrait_width + portrait_x + padding * 6;
	}
	else {
		// Shift the portrait itself over when it is on the right
		draw_portrait_x = x + width + portrait_width + portrait_x - 200;
		draw_portrait_xscale = -1;
	}
	
	// Draw portrait backing
	draw_sprite(spr_portrait, 0, draw_portrait_x, draw_portrait_y);
	
	// Animate the portrait when typing
	var subimg = 0;
	if (!finished)
		subimg = (text_progress / text_speed) * (sprite_get_speed(portrait_sprite) / game_get_speed(gamespeed_fps));
		
	draw_sprite_ext(portrait_sprite, subimg,
		draw_portrait_x + portrait_width / 10, draw_portrait_y + portrait_height / 8,
		draw_portrait_xscale, 1, 0, c_white, 1);
}

// Speaker
if (speaker_name != "") {
	// Expand the nameplate if the name is wider than the default width
	var name_w = max(string_width(speaker_name), speaker_width);
	
	draw_sprite_stretched(spr_name, 0, x + speaker_x, y + speaker_y - speaker_height / 2, name_w, speaker_height);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(speaker_font);
	draw_set_color(speaker_color);
	draw_text(x + speaker_x + name_w / 2, y + speaker_y, speaker_name);
}

// Text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font);
draw_set_color(text_color);
type(draw_text_x + text_x, draw_text_y + text_y, text, text_progress, draw_text_width);
