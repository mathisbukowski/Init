/*
** EPITECH PROJECT, 2024
** ${PROJECT}
** File description:
** Here is a description
*/

#include <SFML/Graphics.h>

int main(void)
{
    sfVideoMode mode = {800, 600, 32};
    sfRenderWindow *window = sfRenderWindow_create(mode, "CSFML WINDOW", sfResize | sfClose, NULL);
    sfEvent event;

    if (!window)
        return -1;
    while(sfRenderWindow_isOpen(window)) {
        while (sfRenderWindow_pollEvent(window, &event)) {
            if (event.type == sfEvtClosed)
                sfRenderWindow_close(window);
        }
        sfRenderWindow_clear(window, sfBlack);
        sfRenderWindow_display(window);
    }
    sfRenderWindow_destroy(window);
    return 0;
}
