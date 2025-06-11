/// Customizable Properties

// Input
confirm_key2 = vk_enter; // button to press to go to the next page
max_input_delay2 = 5; // how many frames to ignore input
input_delay2 = max_input_delay2;

// Position
margin2 = 30; // how much space the textbox gets from the edges of the screen
padding2 = 6; // how much space things inside the textbox get
width2 = display_get_gui_width() - margin2 * 20;
height2 = sprite_height;

x = (display_get_gui_width() - width2) / 2;
y = display_get_gui_height() - height2 - margin2 - 70;

// Text
text_font2 = fnt_text;
text_color2 = c_black;
text_speed2 = 0.6;
text_x2 = padding2;
text_y2 = padding2 * 3;
text_width2 = width2 - padding2 * 2;

// Portrait
portrait_x2 = padding2;
portrait_y2 = padding2;

// Speaker
speaker_x2 = padding2;
speaker_y2 = 0;
speaker_font2 = fnt_name;
speaker_color2 = #464633;

/// Private properties
/*** LOOK BUT DO NOT EDIT! ***/
actions2 = [];
current_action2 = -1;

text2 = "";
text_progress2 = 0;
text_length2 = 0;

portrait_sprite2 = -1;
portrait_width2 = sprite_get_width(spr_portrait);
portrait_height2 = sprite_get_height(spr_portrait);
portrait_side2 = PORTRAIT_SIDE2.LEFT2;

enum PORTRAIT_SIDE2 {
	LEFT2,
	RIGHT2
}

speaker_name2 = "";
speaker_width2 = sprite_get_width(spr_name);
speaker_height2 = sprite_get_height(spr_name);

/// Methods
/*** Generally you never need to call these manually ***/

// Start a conversation
setTopic2 = function(topic2) {
	actions2 = global.topics2[$ topic2];
	current_action2 = -1;
		
	next2();
}

// Move to the next action, or close the textbox if out of actions
next2 = function() {
	current_action2++;
	if (current_action2 >= array_length(actions2)) {
		instance_destroy();
	}
	else {
		actions2[current_action2].act2(id);
	}
}

// Set the text that should be typed out
setText2 = function(newText2) {
	text2 = newText2;
	text_length2 = string_length(newText2);
	text_progress2 = 0;
}