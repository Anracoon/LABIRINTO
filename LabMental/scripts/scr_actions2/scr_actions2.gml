#macro TEXT2 new TextAction2
#macro SPEAKER2 new SpeakerAction2

function DialogueAction2() constructor {
	act2 = function() { };
}

// Define new text to type out
function TextAction2(_text2) : DialogueAction2() constructor {
	text2 = _text2;

	act2 = function(textbox2) {
		textbox2.setText2(text2);
	}
}

// Set the speaker, optionally its portrait and side the portrait is on
function SpeakerAction2(_name2, _sprite2 = undefined, _side2 = undefined): DialogueAction2() constructor {
	name2 = _name2;
	sprite2 = _sprite2;
	side2 = _side2;

	act2 = function(textbox2) {
		textbox2.speaker_name2 = name2;
		
		if (!is_undefined(sprite2))
			textbox2.portrait_sprite2 = sprite2;
			
		if (!is_undefined(side2))
			textbox2.portrait_side2 = side2;
			
		textbox2.next2();
	}
}