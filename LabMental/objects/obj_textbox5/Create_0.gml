/// Customizable Properties

// Input
confirm_key5 = vk_enter; // button to press to go to the next page
max_input_delay5 = 5; // how many frames to ignore input
input_delay5 = max_input_delay5;

// Position
margin5 = 30; // how much space the textbox gets from the edges of the screen
padding5 = 6; // how much space things inside the textbox get
width5 = display_get_gui_width() - margin5 * 20;
height5 = sprite_height;

x = (display_get_gui_width() - width5) / 2;
y = display_get_gui_height() - height5 - margin5 - 70;

// Text
text_font5 = fnt_text;
text_color5 = c_black;
text_speed5 = 0.6;
text_x5 = padding5;
text_y5 = padding5 * 3;
text_width5 = width5 - padding5 * 2;

// Portrait
portrait_x5 = padding5;
portrait_y5 = padding5;

// Speaker
speaker_x5 = padding5;
speaker_y5 = 0;
speaker_font5 = fnt_name;
speaker_color5 = #464633;

/// Private properties
/*** LOOK BUT DO NOT EDIT! ***/
actions5 = [];
current_action5 = -1;

text5 = "";
text_progress5 = 0;
text_length5 = 0;

portrait_sprite5 = -1;
portrait_width5 = sprite_get_width(spr_portrait);
portrait_height5 = sprite_get_height(spr_portrait);
portrait_side5 = PORTRAIT_SIDE5.LEFT5;

enum PORTRAIT_SIDE5 {
	LEFT5,
	RIGHT5
}

speaker_name5 = "";
speaker_width5 = sprite_get_width(spr_name);
speaker_height5 = sprite_get_height(spr_name);

/// Methods
/*** Generally you never need to call these manually ***/

// Start a conversation
setTopic5 = function(topic5) {
	actions5 = global.topics5[$ topic5];
	current_action5 = -1;
		
	next5();
}

// Move to the next action, or close the textbox if out of actions
next5 = function() {
	current_action5++;
	if (current_action5 >= array_length(actions5)) {
		instance_destroy();
	}
	else {
		actions5[current_action5].act5(id);
	}
}

// Set the text that should be typed out
setText5 = function(newText5) {
	text5 = newText5;
	text_length5 = string_length(newText5);
	text_progress5 = 0;
}