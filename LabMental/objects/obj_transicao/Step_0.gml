//animando a sprite
img += img_vel;

//checando se ele preencheu tudo 
if(img - img_num > cols + 1) 
{
	room_goto(destino);
}