// The one function that you need to call!
// Creates a textbox and starts a conversation.
// @param topic - What topic the dialogue box should use
function startDialogue2(topic2) {
	if (instance_exists(obj_textbox2))
		return;
		
	var inst2 = instance_create_depth(x, y, -999, obj_textbox2);
	inst2.setTopic2(topic2);
}

function type2(x, y, text2, progress2, width2) {
	var draw_x2 = 0;
	var draw_y2 = 0;
	
	for (var h = 1; h <= progress2; h++) {
		var char2 = string_char_at(text2, h);
	
		// Handle normal line breaks
		if (char2 == "\n") {
			draw_x2 = 0;
			draw_y2 += string_height("A");
		}
		// If we're starting a new word, we can line break
		else if (char2 == " ") {
			draw_x2 += string_width(char2);
			
			var word_width2 = 0;
			for (var hh = h + 1; hh <= string_length(text2); hh++) {
				var word_char2 = string_char_at(text2, hh);
				
				// If we reached the end of the word, stop checking
				if (word_char2 == "\n" || word_char2 == " ")
					break;
				
				// If the current word extends past the width boundary,
				// then move it to the next line
				word_width2 += string_width(word_char2);
				if (draw_x2 + word_width2 > width2) {
					draw_x2 = 0;
					draw_y2 += string_height("A");
					break;
				}
			}
		}
		else {
			// Draw the letter
			draw_text(x + draw_x2, y + draw_y2, char2);
			draw_x2 += string_width(char2);
		}
	}
}