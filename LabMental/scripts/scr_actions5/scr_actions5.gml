#macro TEXT5 new TextAction5
#macro SPEAKER5 new SpeakerAction5

function DialogueAction5() constructor {
	act5 = function() { };
}

// Define new text to type out
function TextAction5(_text5) : DialogueAction5() constructor {
	text5 = _text5;

	act5 = function(textbox5) {
		textbox5.setText5(text5);
	}
}

// Set the speaker, optionally its portrait and side the portrait is on
function SpeakerAction5(_name5, _sprite5 = undefined, _side5 = undefined): DialogueAction5() constructor {
	name5 = _name5;
	sprite5 = _sprite5;
	side5 = _side5;

	act5 = function(textbox5) {
		textbox5.speaker_name5 = name5;
		
		if (!is_undefined(sprite5))
			textbox5.portrait_sprite5 = sprite5;
			
		if (!is_undefined(side5))
			textbox5.portrait_side5 = side5;
			
		textbox5.next5();
	}
}