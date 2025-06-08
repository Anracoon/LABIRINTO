// Get input
var confirm2 = keyboard_check_pressed(confirm_key2);

// Type out the text
text_progress2 = min(text_progress2 + text_speed2, text_length2);

// Ignore inputs when delay is active
if (input_delay2 > 0) {
	input_delay2--;
	exit;
}

// Are we finished typing?
if (text_progress2 == text_length2) {
	if (confirm2) {
		next2();
	}
}
else if (confirm2) {
	text_progress2 = text_length2;
}