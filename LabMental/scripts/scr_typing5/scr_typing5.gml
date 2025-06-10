// The one function that you need to call!
// Creates a textbox and starts a conversation.
// @param topic - What topic the dialogue box should use
function startDialogue5(topic5) {
	if (instance_exists(obj_textbox5))
		return;
		
	var inst5 = instance_create_depth(x, y, -999, obj_textbox5);
	inst5.setTopic5(topic5);
}

function type5(x, y, text5, progress5, width5) {
	var draw_x5 = 0;
	var draw_y5 = 0;
	
	for (var p = 1; p <= progress5; p++) {
		var char5 = string_char_at(text5, p);
	
		// Handle normal line breaks
		if (char5 == "\n") {
			draw_x5 = 0;
			draw_y5 += string_height("A");
		}
		// If we're starting a new word, we can line break
		else if (char5 == " ") {
			draw_x5 += string_width(char5);
			
			var word_width5 = 0;
			for (var pp = p + 1; pp <= string_length(text5); pp++) {
				var word_char5 = string_char_at(text5, pp);
				
				// If we reached the end of the word, stop checking
				if (word_char5 == "\n" || word_char5 == " ")
					break;
				
				// If the current word extends past the width boundary,
				// then move it to the next line
				word_width5 += string_width(word_char5);
				if (draw_x5 + word_width5 > width5) {
					draw_x5 = 0;
					draw_y5 += string_height("A");
					break;
				}
			}
		}
		else {
			// Draw the letter
			draw_text(x + draw_x5, y + draw_y5, char5);
			draw_x5 += string_width(char5);
		}
	}
}