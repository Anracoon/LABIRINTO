// Get input
var confirm2 = keyboard_check_pressed(confirm_key5);

// Type out the text
text_progress5 = min(text_progress5 + text_speed5, text_length5);

// Ignore inputs when delay is active
if (input_delay5 > 0) {
	input_delay5--;
	exit;
}

// Are we finished typing?
if (text_progress5 == text_length5) {
	if (confirm5) {
		next5();
	}
}
else if (confirm5) {
	text_progress5 = text_length5;
}