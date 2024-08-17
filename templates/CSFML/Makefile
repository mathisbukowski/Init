##
## EPITECH PROJECT, 2024
## ${PROJECT}
## File description:
## Here is a description
##

SRC = src/main.c

NAME = ${PROJECT}

CFLAGS =  -Wall -Wextra -g

FLAGS = -lcsfml-graphics -lcsfml-audio -lcsfml-system -lm

all : \$(NAME)

\$(NAME) :
    gcc \$(CFLAGS) \$(SRC) -o \$(NAME) -I./include/

clean:
    rm -f \$(OBJ)

fclean: clean
    rm -f \$(NAME)

re: fclean all
