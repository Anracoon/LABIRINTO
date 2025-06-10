tamanho = sprite_get_width(spr_quads)

cols  = ceil (room_width / tamanho);

lins  = ceil (room_width / tamanho);

// animação
//imagem inicial 
img = 0;

//velocidade da animação 
img_vel = sprite_get_speed(spr_quads) / game_get_speed(2);

//total da animação 
img_num = sprite_get_number(spr_quads) - 1;

destino = cena3;