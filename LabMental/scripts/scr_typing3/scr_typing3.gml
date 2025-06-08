// The one function that you need to call!
// Creates a textbox and starts a conversation.
// @param topic - What topic the dialogue box should use
function startDialogue3(topic3) {
	if (instance_exists(obj_textbox3))
		return;
		
	var inst3 = instance_create_depth(x, y, -999, obj_textbox3);
	inst3.setTopic3(topic3);
}

function type3(x, y, text3, progress3, width3) {
	var draw_x3 = 0;
	var draw_y3 = 0;
	
	for (var j = 1; j <= progress3; j++) {
		var char3 = string_char_at(text3, j);
	
		// Handle normal line breaks
		if (char3 == "\n") {
			draw_x3 = 0;
			draw_y3 += string_height("A");
		}
		// If we're starting a new word, we can line break
		else if (char3 == " ") {
			draw_x3 += string_width(char3);
			
			var word_width3 = 0;
			for (var jj = j + 1; jj <= string_length(text3); jj++) {
				var word_char3 = string_char_at(text3, jj);
				
				// If we reached the end of the word, stop checking
				if (word_char3 == "\n" || word_char3 == " ")
					break;
				
				// If the current word extends past the width boundary,
				// then move it to the next line
				word_width3 += string_width(word_char3);
				if (draw_x3 + word_width3 > width3) {
					draw_x3 = 0;
					draw_y3 += string_height("A");
					break;
				}
			}
		}
		else {
			// Draw the letter
			draw_text(x + draw_x3, y + draw_y3, char3);
			draw_x3 += string_width(char3);
		}
	}
}