	if (!instance_exists(obj_transicao))
	{
		instance_create_layer(0, 0, layer, obj_transicao).depth = -100;
		obj_transicao.destino = DIG3;
	}