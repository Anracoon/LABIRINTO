if(index == 0)
{
	room_goto(cena1);

}else if(index == 1)
{
	if (!instance_exists(obj_transicao))
	{
		instance_create_layer(0, 0, layer, obj_transicao).depth = -100;
		obj_transicao.destino = creditos;
	}
	
}else if(index == 2)
{
	game_end();
}