function scr_textos(){
	switch npc_nome{
		case "obj_opsicologo":
		    ds_grid_add_text("pscologo", spr_retrato_2, 0, "psicologo")
			ds_grid_add_text("fala player", iconLabGame, 1, "player")
		    ds_grid_add_text("psicologo fala", spr_retrato_2, 0, "psicologo")
			ds_grid_add_text("player fala!", iconLabGame, 1, "player")
		break;
	}
		
}

function ds_grid_add_row() {
    ///@arg ds_grid
   
    var _grid = argument[0];
    ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid) + 1);
    return (ds_grid_height(_grid) - 1);
}

function ds_grid_add_text(texto, retrato, lado, nome){
    var _grid = texto_grid;
    var _y = ds_grid_add_row(_grid);
    
    _grid[# 0, _y] = argument[0];
    _grid[# 1, _y] = argument[1]
    _grid[# 2, _y] = argument[2];
    _grid[# 3, _y] = argument[3];
}