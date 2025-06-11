var tecla_cima = keyboard_check(vk_up)
var tecla_baixo = keyboard_check(vk_down);
var tecla_esquerda = keyboard_check(vk_left);
var tecla_direita = keyboard_check(vk_right);

var tecla = tecla_direita - tecla_esquerda != 0 || tecla_baixo - tecla_cima != 0;

dir = point_direction(0,0,tecla_direita - tecla_esquerda,tecla_baixo - tecla_cima);

velh = lengthdir_x(velc * tecla,dir);
velv = lengthdir_y(velc * tecla,dir);

if(place_meeting(x+velh,y,obj_parede))
{
	while(!place_meeting(x+sign(velh),y,obj_parede)){
	x = x + sign(velh);
	}
	velh = 0;
}

x+=velh;

if(place_meeting(x,y+velv,obj_parede)){

while(!place_meeting(x,y+sign(velv),obj_parede))
{
	y = y + sign(velv);
}
velv = 0;
}


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

if(place_meeting(x+velh,y,Obj_IrmaoSala1))
{
	Obj_IrmaoSala1.visible=0;
	Obj_irmaoSala2.visible=100;
}

if(place_meeting(x+velh,y,Obj_irmaoSala2))
{
	Obj_irmaoSala2.visible=0;
	Obj_irmaoSala3.visible=100;
	
}