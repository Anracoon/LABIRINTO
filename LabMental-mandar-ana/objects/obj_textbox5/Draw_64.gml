// Draw the box
draw_sprite_stretched(sprite_index, 0, x, y, width5, height5);

var draw_text_x5 = x;
var draw_text_y5 = y;
var draw_text_width5 = text_width5;

var finished5 = text_progress5 == text_length5;

// Portrait
if (sprite_exists(portrait_sprite5)) {
	// Shrink text width by the width the portrait will take up
	draw_text_width5 -= portrait_width5 + portrait_x5 + padding5 * 6;
	
	var draw_portrait_x5 = x + portrait_x5;
	var draw_portrait_y5 = y + portrait_y5;
	var draw_portrait_xscale5 = 1;
	
	// What side is the portrait on?
	if (portrait_side5 == PORTRAIT_SIDE5.LEFT5) {
		// Shift the text over when the portrait is on the left
		draw_text_x5 += portrait_width5 + portrait_x5 + padding5 * 6;
	}
	else {
		// Shift the portrait itself over when it is on the right
		draw_portrait_x5 = x + width5 + portrait_width5 + portrait_x5 - 200;
		draw_portrait_xscale5 = -1;
	}
	
	// Draw portrait backing
	draw_sprite(spr_portrait, 0, draw_portrait_x5, draw_portrait_y5);
	
	// Animate the portrait when typing
	var subimg5 = 0;
	if (!finished5)
		subimg5 = (text_progress5 / text_speed5) * (sprite_get_speed(portrait_sprite5) / game_get_speed(gamespeed_fps));
		
	draw_sprite_ext(portrait_sprite5, subimg5,
		draw_portrait_x5 + portrait_width5 / 10, draw_portrait_y5 + portrait_height5 / 8,
		draw_portrait_xscale5, 1, 0, c_white, 1);
}

// Speaker
if (speaker_name5 != "") {
	// Expand the nameplate if the name is wider than the default width
	var name_w = max(string_width(speaker_name5), speaker_width5);
	
	draw_sprite_stretched(spr_name, 0, x + speaker_x5, y + speaker_y5 - speaker_height5 / 2, name_w, speaker_height5);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(speaker_font5);
	draw_set_color(speaker_color5);
	draw_text(x + speaker_x5 + name_w / 2, y + speaker_y5, speaker_name5);
}

// Text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font5);
draw_set_color(text_color5);
type(draw_text_x5 + text_x5, draw_text_y5 + text_y5, text5, text_progress5, draw_text_width5);