// Get input
var confirm3 = keyboard_check_pressed(confirm_key3);

// Type out the text
text_progress3 = min(text_progress3 + text_speed3, text_length3);

// Ignore inputs when delay is active
if (input_delay3 > 0) {
	input_delay3--;
	exit;
}

// Are we finished typing?
if (text_progress3 == text_length3) {
	if (confirm3) {
		next3();
	}
}
else if (confirm3) {
	text_progress3 = text_length3;
}