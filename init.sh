#!/bin/bash

PROJECT=$1
# INIT MAKEFILE

if [ -z "${PROJECT}" ]; then
    echo "No value for the project name. Please retry."
    exit 1
fi

echo "##
## EPITECH PROJECT, 2024
## ${PROJECT}
## File description:
## Here is a description
##

SRC = src/main.c

NAME = ${PROJECT}

CFLAGS =  -Wall -Wextra -g

all : \$(NAME)

\$(NAME) :
\tgcc \$(CFLAGS) \$(SRC) -o \$(NAME) -I./include/

clean:
\trm -f \$(OBJ)

fclean: clean
\trm -f \$(NAME)

re: fclean all" > Makefile

echo "Makefile successfully created for ${PROJECT} project.\n"