#macro TEXT3 new TextAction3
#macro SPEAKER3 new SpeakerAction3

function DialogueAction3() constructor {
	act2 = function() { };
}

// Define new text to type out
function TextAction3(_text3) : DialogueAction3() constructor {
	text3 = _text3;

	act3 = function(textbox3) {
		textbox3.setText3(text3);
	}
}

// Set the speaker, optionally its portrait and side the portrait is on
function SpeakerAction3(_name3, _sprite3 = undefined, _side3 = undefined): DialogueAction3() constructor {
	name3 = _name3;
	sprite3 = _sprite3;
	side3 = _side3;

	act3 = function(textbox3) {
		textbox3.speaker_name3 = name3;
		
		if (!is_undefined(sprite3))
			textbox3.portrait_sprite3 = sprite3;
			
		if (!is_undefined(side3))
			textbox3.portrait_side3 = side3;
			
		textbox3.next3();
	}
}