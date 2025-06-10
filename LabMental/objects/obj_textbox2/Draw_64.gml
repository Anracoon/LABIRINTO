// Draw the box
draw_sprite_stretched(sprite_index, 0, x, y, width2, height2);

var draw_text_x2 = x;
var draw_text_y2 = y;
var draw_text_width2 = text_width2;

var finished2 = text_progress2 == text_length2;

// Portrait
if (sprite_exists(portrait_sprite2)) {
	// Shrink text width by the width the portrait will take up
	draw_text_width2 -= portrait_width2 + portrait_x2 + padding2 * 6;
	
	var draw_portrait_x2 = x + portrait_x2;
	var draw_portrait_y2 = y + portrait_y2;
	var draw_portrait_xscale2 = 1;
	
	// What side is the portrait on?
	if (portrait_side2 == PORTRAIT_SIDE2.LEFT2) {
		// Shift the text over when the portrait is on the left
		draw_text_x2 += portrait_width2 + portrait_x2 + padding2 * 6;
	}
	else {
		// Shift the portrait itself over when it is on the right
		draw_portrait_x2 = x + width2 - portrait_width2 - portrait_x2 - 200;
		draw_portrait_xscale2 = -1;
	}
	
	// Draw portrait backing
	draw_sprite(spr_portrait, 0, draw_portrait_x2, draw_portrait_y2);
	
	// Animate the portrait when typing
	var subimg2 = 0;
	if (!finished2)
		subimg2 = (text_progress2 / text_speed2) * (sprite_get_speed(portrait_sprite2) / game_get_speed(gamespeed_fps));
		
	draw_sprite_ext(portrait_sprite2, subimg2,
		draw_portrait_x2 + portrait_width2 / 10, draw_portrait_y2 + portrait_height2 / 8,
		draw_portrait_xscale2, 1, 0, c_white, 1);
}

// Speaker
if (speaker_name2 != "") {
	// Expand the nameplate if the name is wider than the default width
	var name_w = max(string_width(speaker_name2), speaker_width2);
	
	draw_sprite_stretched(spr_name, 0, x + speaker_x2, y + speaker_y2 - speaker_height2 / 2, name_w, speaker_height2);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(speaker_font2);
	draw_set_color(speaker_color2);
	draw_text(x + speaker_x2 + name_w / 2, y + speaker_y2, speaker_name2);
}

// Text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font2);
draw_set_color(text_color2);
type(draw_text_x2 + text_x2, draw_text_y2 + text_y2, text2, text_progress2, draw_text_width2);