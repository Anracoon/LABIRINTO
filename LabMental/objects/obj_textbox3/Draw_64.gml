// Draw the box
draw_sprite_stretched(sprite_index, 0, x, y, width3, height3);

var draw_text_x3 = x;
var draw_text_y3 = y;
var draw_text_width3 = text_width3;

var finished3 = text_progress3 == text_length3;

// Portrait
if (sprite_exists(portrait_sprite3)) {
	// Shrink text width by the width the portrait will take up
	draw_text_width3 -= portrait_width3 + portrait_x3 + padding3* 6;
	
	var draw_portrait_x3 = x + portrait_x3;
	var draw_portrait_y3 = y + portrait_y3;
	var draw_portrait_xscale3 = 1;
	
	// What side is the portrait on?
	if (portrait_side3 == PORTRAIT_SIDE3.LEFT3) {
		// Shift the text over when the portrait is on the left
		draw_text_x3 += portrait_width3 + portrait_x3 + padding3 * 6;
	}
	else {
		// Shift the portrait itself over when it is on the right
		draw_portrait_x3 = x + width3 - portrait_width3 - portrait_x3;
		draw_portrait_xscale3 = -1;
	}
	
	// Draw portrait backing
	draw_sprite(spr_portrait, 0, draw_portrait_x3, draw_portrait_y3);
	
	// Animate the portrait when typing
	var subimg3 = 0;
	if (!finished3)
		subimg3 = (text_progress3 / text_speed3) * (sprite_get_speed(portrait_sprite3) / game_get_speed(gamespeed_fps));
		
	draw_sprite_ext(portrait_sprite3, subimg3,
		draw_portrait_x3 + portrait_width3 / 10, draw_portrait_y3 + portrait_height3 / 8,
		draw_portrait_xscale3, 1, 0, c_white, 1);
}

// Speaker
if (speaker_name3 != "") {
	// Expand the nameplate if the name is wider than the default width
	var name_w = max(string_width(speaker_name3), speaker_width3);
	
	draw_sprite_stretched(spr_name, 0, x + speaker_x3, y + speaker_y3 - speaker_height3 / 2, name_w, speaker_height3);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(speaker_font3);
	draw_set_color(speaker_color3);
	draw_text(x + speaker_x3 + name_w / 2, y + speaker_y3, speaker_name3);
}

// Text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font3);
draw_set_color(text_color3);
type(draw_text_x3 + text_x3, draw_text_y3 + text_y3, text3, text_progress3, draw_text_width3);