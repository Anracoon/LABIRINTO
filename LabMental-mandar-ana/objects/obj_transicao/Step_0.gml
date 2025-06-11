
if (entrando){
	//animando a sprite
	img += img_vel;

	//checando se ele preencheu tudo 
	if(img - img_num > cols + 1) 
	{
		if (room_exists(destino))
		{
			room_goto(destino)
			entrando = false
		}
	}
}else {
	img -= img_vel;
	
	if (img < -5){
		instance_destroy()	
	}
}