/// Customizable Properties

// Input
confirm_key4 = vk_enter; // button to press to go to the next page
max_input_delay4 = 5; // how many frames to ignore input
input_delay4 = max_input_delay4;

// Position
margin4 = 30; // how much space the textbox gets from the edges of the screen
padding4 = 6; // how much space things inside the textbox get
width4 = display_get_gui_width() - margin4 * 20;
height4 = sprite_height;

x = (display_get_gui_width() - width4) / 2;
y = display_get_gui_height() - height4 - margin4 - 70;

// Text
text_font4 = fnt_text;
text_color4 = c_black;
text_speed4 = 0.6;
text_x4 = padding4;
text_y4 = padding4 * 3;
text_width4 = width4 - padding4 * 2;

// Portrait
portrait_x4 = padding4;
portrait_y4 = padding4;

// Speaker
speaker_x4 = padding4;
speaker_y4 = 0;
speaker_font4 = fnt_name;
speaker_color4 = #464633;

/// Private properties
/*** LOOK BUT DO NOT EDIT! ***/
actions4 = [];
current_action4 = -1;

text3 = "";
text_progress4 = 0;
text_length4 = 0;

portrait_sprite4 = -1;
portrait_width4 = sprite_get_width(spr_portrait);
portrait_height4 = sprite_get_height(spr_portrait);
portrait_side4 = PORTRAIT_SIDE4.LEFT4;

enum PORTRAIT_SIDE4 {
	LEFT4,
	RIGHT4
}

speaker_name4 = "";
speaker_width4 = sprite_get_width(spr_name);
speaker_height4 = sprite_get_height(spr_name);

/// Methods
/*** Generally you never need to call these manually ***/

// Start a conversation
setTopic4 = function(topic4) {
	actions4 = global.topics4[$ topic4];
	current_action4 = -1;
		
	next4();
}

// Move to the next action, or close the textbox if out of actions
next4 = function() {
	current_action4++;
	if (current_action4 >= array_length(actions4)) {
		instance_destroy();
	}
	else {
		actions4[current_action4].act4(id);
	}
}

// Set the text that should be typed out
setText4 = function(newText4) {
	text4 = newText4;
	text_length4 = string_length(newText4);
	text_progress4 = 0;
}