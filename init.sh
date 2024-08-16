#!/bin/bash

# BOLDGREEN="\033[0;1;${GREEN}m"
# Define of Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
ENDCOLOR="\033[0m"
PROJECT=$1
# INIT MAKEFILE

printLineWithColor () {
    local color=$1
    local message=$2
    echo -e "${color}${message}${ENDCOLOR}"
}

if [ -z "${PROJECT}" ]; then
    echo -e "No value for the project name. ${RED}Please retry.${ENDCOLOR}"
    exit 1
fi

printLineWithColor ${BLUE} "Do you want to make a global initialization ?"
read -p "$(echo -e "${YELLOW}Enter your choice ? (Yes/No) ${ENDCOLOR}")" choosen

if [[ "${choosen}" = "Yes" ]]; then
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
        gcc \$(CFLAGS) \$(SRC) -o \$(NAME) -I./include/

    clean:
        rm -f \$(OBJ)

    fclean: clean
        rm -f \$(NAME)

    re: fclean all" > Makefile
    echo ".idea/
    vgcore.*
    *.gcno
    *.gcda
    *.o" > .gitignore.template
    mkdir -p "src"
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
    }" > src/main.c
    mkdir -p "include"
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
    " > include/${PROJECT}.h
    printLineWithColor ${GREEN} "Project initialized with success."
    exit 0
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
    gcc \$(CFLAGS) \$(SRC) -o \$(NAME) -I./include/

clean:
    rm -f \$(OBJ)

fclean: clean
    rm -f \$(NAME)

re: fclean all" > Makefile

printLineWithColor ${GREEN} "Makefile successfully created for ${PROJECT} project."

# INIT GITIGNORE

printLineWithColor ${BLUE} "Do you want to ignore .idea ?"
read -p "$(echo -e "${YELLOW}Enter your choice ? (Yes/No) ${ENDCOLOR}")" choice

if [[ "${choice}" = "Yes" ]]; then
    echo ".idea/" > .gitignore.template
    printLineWithColor ${GREEN} "Successfully added to gitignore. ✅"
else
    printLineWithColor ${RED} "Not added. ❌"
fi

printLineWithColor ${BLUE} "Do you want to ignore valgrind files ?"
read -p "$(echo -e "${YELLOW}Enter your choice ? (Yes/No) ${ENDCOLOR}")" choice

if [[ "${choice}" = "Yes" ]]; then
    echo "vgcore.*" >> .gitignore.template
    printLineWithColor ${GREEN} "Successfully added to gitignore. ✅"
else
    printLineWithColor ${RED} "Not added. ❌"
fi

printLineWithColor ${BLUE} "Do you want to ignore unit test files ?"
read -p "$(echo -e "${YELLOW}Enter your choice ? (Yes/No) ${ENDCOLOR}")" choice

if [[ "${choice}" = "Yes" ]]; then
    echo "*.gcno" >> .gitignore.template
    echo "*.gcda" >> .gitignore.template
    printLineWithColor ${GREEN} "Successfully added to gitignore. ✅"
else
    printLineWithColor ${RED} "Not added. ❌"
fi

# SRC INIT

if [ ! -d "src" ]; then
    printLineWithColor ${BLUE} "Creating directory 'src'"
    mkdir -p "src"
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
    }" > src/main.c
else
    printLineWithColor ${RED} "Directory 'src' already exists"
fi

sleep 2
printLineWithColor ${GREEN} "Source Directory created."

# INCLUDE INIT

if [ ! -d "include" ]; then
    printLineWithColor ${BLUE} "Creating directory 'include'"
    mkdir -p "include"
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
    " > include/${PROJECT}.h
else
    printLineWithColor ${RED} "Directory 'include' already exists"
fi

sleep 2
printLineWithColor ${GREEN} "Include Directory created."
