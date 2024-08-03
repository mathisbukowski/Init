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

echo "Makefile successfully created for ${PROJECT} project."

# INIT GITIGNORE

touch .gitignore.template
echo "Do you want to ignore .idea ?"
read -p "Enter your choice: (Yes/No) " choice

if [[ "${choice}" = "Yes" ]]; then
    echo ".idea/" > .gitignore.template
    echo "Successfully added to gitignore. ✅"
else
    echo "Not added. ❌"
fi

echo "Do you want to ignore valgrind files ?"
read -p "Enter your choice: (Yes/No) " choice

if [[ "${choice}" = "Yes" ]]; then
    echo "vgcore.*" >> .gitignore.template
    echo "Successfully added to gitignore. ✅"
else
    echo "Not added. ❌"
fi

echo "Do you want to ignore unit test files ?"
read -p "Enter your choice: (Yes/No) " choice

if [[ "${choice}" = "Yes" ]]; then
    echo "*.gcno" >> .gitignore.template
    echo "*.gcda" >> .gitignore.template
    echo "Successfully added to gitignore. ✅"
else
    echo "Not added. ❌"
fi

# SRC INIT

if [ ! -d "src" ]; then
    echo "Creating directory 'src'"
    mkdir -p "src"
else
    echo "Directory 'src' already exists"
    exit 1
fi
cd src
echo "/*
** EPITECH PROJECT, 2024
** ${PROJECT}
** File description:
** Here is a description
*/

#include <stdio.h>

int main(int ac, char **av)
{
    printf(\"Hello World\");
    return 0;
}" > main.c

sleep 2
echo "Source Directory created."

# INCLUDE INIT

if [ ! -d "include" ]; then
    echo "Creating directory 'include'"
    mkdir -p "include"
else
    echo "Directory 'include' already exists"
    exit 1
fi
cd src
echo "/*
** EPITECH PROJECT, 2024
** ${PROJECT}
** File description:
** Here is a description
*/

#ifndef ${PROJECT}_H
    #define ${PROJECT}_H
    #include <stdlib.h>
    #include <stdio.h>

#endif /* ${PROJECT}_H */
" > ${PROJECT}.h

sleep 2
echo "Include Directory created."