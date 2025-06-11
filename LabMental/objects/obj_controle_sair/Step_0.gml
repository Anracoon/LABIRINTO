
// Verifica se Enter foi pressionado
if (keyboard_check_pressed(vk_space)) {
    tecla_pressionada = true;
    
    // Define os destinos com base na sala atual
    switch (room) {
        case cena1: 
            destinos = DIG1;
            break;
            
        case DIG2:
			audio_stop_sound(snd_quartinho);
            destinos = gameLabirinto; 
            break;
            
        case gameLabirinto:
            destinos = DIG3;
            break;
            
        case DIG4:
			audio_stop_sound(snd_pscicici);
            destinos = gameFinal; 
            break;
            
        case gameFinal:
            destinos = digFinal; 
            break;
            
        default:
            destinos = noone;
            break;
    }
    
    // Se tem um destino definido, muda de sala
	if (!instance_exists(obj_transicao))
	{
		instance_create_layer(0, 0,layer, obj_transicao).depth = -1000;
		obj_transicao.destino = destinos;
	}
}