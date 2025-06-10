#macro TEXT4 new TextAction4
#macro SPEAKER4 new SpeakerAction4

function DialogueAction4() constructor {
	act4 = function() { };
}

// Define new text to type out
function TextAction4(_text4) : DialogueAction4() constructor {
	text4 = _text4;

	act4 = function(textbox4) {
		textbox4.setText4(text4);
	}
}

// Set the speaker, optionally its portrait and side the portrait is on
function SpeakerAction4(_name4, _sprite4 = undefined, _side4 = undefined): DialogueAction4() constructor {
	name4 = _name4;
	sprite4 = _sprite4;
	side4 = _side4;

	act4 = function(textbox4) {
		textbox4.speaker_name4 = name4;
		
		if (!is_undefined(sprite4))
			textbox4.portrait_sprite4 = sprite4;
			
		if (!is_undefined(side4))
			textbox4.portrait_side4 = side4;
			
		textbox4.next4();
	}
}