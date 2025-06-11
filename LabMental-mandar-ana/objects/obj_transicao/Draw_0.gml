//desenhando 

//linhas 

for (var i = 0; i < lins; i++)
{
	//colunas
	for (var j = 0; j < cols; j++) 
	{
		//celula
		//draw_sprite(spr_quads, 8, j * tamanho, i * tamanho); 
		
		var _img = min(max(0, img - i), img_num); 
		
		draw_sprite_ext(spr_quads, _img, j *tamanho, i * tamanho, 1, 1, 0, c_black, 1);
	}
}