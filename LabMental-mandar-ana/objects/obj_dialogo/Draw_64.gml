if inicializar == true{
    var _guil = display_get_gui_width();
    var _guia = display_get_gui_height();
	
    var _xx = 220;
    var _yy = _guil - 300;
    var _c = c_maroon;
    var _sprite = texto_grid[# infos.retrato, pagina];
	var _texto = string_copy(texto_grid[# infos.texto, pagina], 0, caractere);
    draw_set_font(FNT_dialogo)

    //lado esquerdo
    if texto_grid[# infos.lado, pagina] == 0{
        draw_rectangle_color(_xx +200, _yy, _guil - 5, _guia, _c, _c, _c, _c, false); 
		draw_text(_xx + 216, _yy , texto_grid[# infos.nomes, pagina] )
        draw_text_ext(_xx + 232, _yy + 32, _texto, 32, _guil - 600);

        draw_sprite_ext(_sprite, 0, _xx - 180, _yy + 32, 2, 2, 0, c_white, 1);
 } //lado direito
 else{
	 draw_rectangle_color(_xx - 222, _yy, _guil - 400, _guia, _c, _c, _c, _c, false); 
	 var _stgw = string_width(texto_grid[# infos.nomes, pagina]);
	 draw_text(_guil - 430 - _stgw, _yy, texto_grid[# infos.nomes, pagina] )
     draw_text_ext(_xx - 200, _yy + 32, _texto, 32, _guil - 264);
	
	draw_sprite_ext(_sprite, 0, _xx + 1150, _yy + 100, 2, 2, 0, c_white, 1);
  }
}