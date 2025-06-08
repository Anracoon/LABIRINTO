// The one function that you need to call!
// Creates a textbox and starts a conversation.
// @param topic - What topic the dialogue box should use
function startDialogue4(topic4) {
	if (instance_exists(obj_textbox4))
		return;
		
	var inst4 = instance_create_depth(x, y, -999, obj_textbox4);
	inst4.setTopic4(topic4);
}

function type4(x, y, text4, progress4, width4) {
	var draw_x4 = 0;
	var draw_y4 = 0;
	
	for (var g = 1; g <= progress4; g++) {
		var char4 = string_char_at(text4, g);
	
		// Handle normal line breaks
		if (char4 == "\n") {
			draw_x4 = 0;
			draw_y4 += string_height("A");
		}
		// If we're starting a new word, we can line break
		else if (char4 == " ") {
			draw_x4 += string_width(char4);
			
			var word_width4 = 0;
			for (var gg = g + 1; gg <= string_length(text4); gg++) {
				var word_char4 = string_char_at(text4, gg);
				
				// If we reached the end of the word, stop checking
				if (word_char4 == "\n" || word_char4 == " ")
					break;
				
				// If the current word extends past the width boundary,
				// then move it to the next line
				word_width4 += string_width(word_char4);
				if (draw_x4 + word_width4 > width4) {
					draw_x4 = 0;
					draw_y4 += string_height("A");
					break;
				}
			}
		}
		else {
			// Draw the letter
			draw_text(x + draw_x4, y + draw_y4, char4);
			draw_x4 += string_width(char4);
		}
	}
}