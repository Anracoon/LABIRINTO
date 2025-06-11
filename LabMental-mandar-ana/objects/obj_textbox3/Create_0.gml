/// Customizable Properties

// Input
confirm_key3 = vk_enter; // button to press to go to the next page
max_input_delay3 = 5; // how many frames to ignore input
input_delay3 = max_input_delay3;

// Position
margin3 = 30; // how much space the textbox gets from the edges of the screen
padding3 = 6; // how much space things inside the textbox get
width3 = display_get_gui_width() - margin3 * 20;
height3 = sprite_height;

x = (display_get_gui_width() - width3) / 2;
y = display_get_gui_height() - height3 - margin3 - 70;

// Text
text_font3 = fnt_text;
text_color3 = c_black;
text_speed3 = 0.6;
text_x3 = padding3;
text_y3 = padding3 * 3;
text_width3 = width3 - padding3 * 2;

// Portrait
portrait_x3 = padding3;
portrait_y3 = padding3;

// Speaker
speaker_x3 = padding3;
speaker_y3 = 0;
speaker_font3 = fnt_name;
speaker_color3 = #464633;

/// Private properties
/*** LOOK BUT DO NOT EDIT! ***/
actions3 = [];
current_action3 = -1;

text3 = "";
text_progress3 = 0;
text_length3 = 0;

portrait_sprite3 = -1;
portrait_width3 = sprite_get_width(spr_portrait);
portrait_height3 = sprite_get_height(spr_portrait);
portrait_side3 = PORTRAIT_SIDE3.LEFT3;

enum PORTRAIT_SIDE3 {
	LEFT3,
	RIGHT3
}

speaker_name3 = "";
speaker_width3 = sprite_get_width(spr_name);
speaker_height3 = sprite_get_height(spr_name);

/// Methods
/*** Generally you never need to call these manually ***/

// Start a conversation
setTopic3 = function(topic3) {
	actions3 = global.topics3[$ topic3];
	current_action3 = -1;
		
	next3();
}

// Move to the next action, or close the textbox if out of actions
next3 = function() {
	current_action3++;
	if (current_action3 >= array_length(actions3)) {
		instance_destroy();
	}
	else {
		actions3[current_action3].act3(id);
	}
}

// Set the text that should be typed out
setText3 = function(newText3) {
	text3 = newText3;
	text_length3 = string_length(newText3);
	text_progress3 = 0;
}