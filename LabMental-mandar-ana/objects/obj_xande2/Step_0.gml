var tecla_cima = keyboard_check(vk_up)
var tecla_baixo = keyboard_check(vk_down);
var tecla_esquerda = keyboard_check(vk_left);
var tecla_direita = keyboard_check(vk_right);

var tecla = tecla_direita - tecla_esquerda != 0 || tecla_baixo - tecla_cima != 0;

dir = point_direction(0,0,tecla_direita - tecla_esquerda,tecla_baixo - tecla_cima);

velh = lengthdir_x(velc * tecla,dir);
velv = lengthdir_y(velc * tecla,dir);


if(place_meeting(x+velh,y,obj_opsicologo))
{
	while(!place_meeting(x+sign(velh),y,obj_opsicologo)){
	x = x + sign(velh);
	}
	velh = 0;
}

if(place_meeting(x,y+velv,obj_opsicologo)){
	while(!place_meeting(x,y+sign(velv),obj_opsicologo)){
		y=y + sign(velv);
	}
	velv = 0;
}

y+=velv;

if distance_to_object(obj_par_npc) <= 10{
	if keyboard_check_pressed(ord("F")) {
		var _npc = instance_nearest(x,y, obj_par_npc)
		var _dialogo = instance_create_layer(x,y,"dialogo", obj_dialogo);
		_dialogo.npc_nome = _npc.nome;
	}
}