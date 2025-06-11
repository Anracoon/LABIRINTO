// Get input
var confirm4 = keyboard_check_pressed(confirm_key4);

// Type out the text
text_progress4 = min(text_progress4 + text_speed4, text_length4);

// Ignore inputs when delay is active
if (input_delay4 > 0) {
	input_delay4--;
	exit;
}

// Are we finished typing?
if (text_progress4 == text_length4) {
	if (confirm4) {
		next4();
	}
}
else if (confirm4) {
	text_progress4 = text_length4;
}