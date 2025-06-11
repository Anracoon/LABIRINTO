if (mostrar_botao) {
    draw_sprite(botao, 0, 200, 500);
    
    // Verifica se Enter foi pressionado
    if (keyboard_check_pressed(vk_enter)) {
        mostrar_botao = false; // Para de mostrar depois de pressionar Enter
    }
}
