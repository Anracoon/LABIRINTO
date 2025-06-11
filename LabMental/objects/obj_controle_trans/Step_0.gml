// Verifica se Enter foi pressionado
if (keyboard_check_pressed(vk_space)) {
    tecla_pressionada = true;
    
    // Define os destinos com base na sala atual
    switch (room) {
        case creditos:
            destinos = menu;
            break;
            
        case DIG2:
            destinos = gameLabirinto;
			audio_stop_sound(snd_quartinho);
            break;
            
        case cena1:
            destinos = DIG1;
            break;
            
        case DIG4:
            destinos = gameFinal;
			audio_stop_sound(snd_pscicici);
            break;
			
		case digFinal:
			destinos = obj_textbox.destiny;
            break;
			//aq e pra facilitar a vida de vcs nao precisa fechar o jogo é so aperta espaço
		case cenaFinalBom:
            destinos = menu;
            break;
			
		case cenaFinalRuim:
            destinos = menu;
            break;
            
        default:
            destinos = noone;
            break;
    }
    
    // Se tem um destino definido, muda de sala
	if (!instance_exists(obj_transicao))
	{
		instance_create_layer(0, 0, layer, obj_transicao).depth = -100;
		obj_transicao.destino = destinos;
	}
}