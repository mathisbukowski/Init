#!/bin/bash
set -e

# GLOBAL VARS
PROJECT_NAME=$1
REPO_URL=$2
BASE_URL="https://github.com/mathisbukowski/Init/"
BRANCH="main"
TEMPLATE_DIR="templates"
API_URL="https://api.github.com/repos/mathisbukowski/Init/contents/$TEMPLATE_DIR?ref=$BRANCH"

# Define of Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
ENDCOLOR="\033[0m"

printLineWithColor () {
    local color=$1
    local message=$2
    echo -e "${color}${message}${ENDCOLOR}"
}

if [ -z "$PROJECT_NAME" ] || [ -z "$REPO_URL" ]; then
    printLineWithColor $RED "Error: Missing arguments."
    echo "Usage: $0 <project-name> <repo-url>"
    exit 1
fi

printLineWithColor $BLUE "Cloning the repository..."
git clone $REPO_URL $PROJECT_NAME
sleep 2
printLineWithColor $GREEN "Repository has been cloned with success."

printLineWithColor $BLUE "Please choose a template from the following options :"
curl -s $API_URL | grep '"name"' | cut -d '"' -f 4

read -p "Enter the name of the template: " TEMPLATE_CHOICE

TEMPLATE_ZIP_URL="${BASE_URL}/archive/refs/heads/$BRANCH.zip"
curl -L -o template.zip $TEMPLATE_ZIP_URL

unzip template.zip "Init-$BRANCH/$TEMPLATE_DIR/$TEMPLATE_CHOICE/*" -d ./

cp -a "Init-$BRANCH/$TEMPLATE_DIR/$TEMPLATE_CHOICE/." "./$PROJECT_NAME/"

rm -rf "Init-$BRANCH"
rm template.zip

read -p "$(echo -e "${YELLOW}Do you want to add Github workflows ? (Yes/No) ${ENDCOLOR}")" choice

if [[ -z "$choice" || "$choice" == "Yes" ]]; then
    TEMPLATE_ZIP_URL="${BASE_URL}/archive/refs/heads/$BRANCH.zip"
    curl -L -o template.zip $TEMPLATE_ZIP_URL
    unzip template.zip "Init-$BRANCH/$TEMPLATE_DIR/Devops/*" -d ./
    mkdir -p "./$PROJECT_NAME/.github/"
    cp -r "Init-$BRANCH/$TEMPLATE_DIR/Devops/.github/workflows/" "./$PROJECT_NAME/.github"
    rm -rf "Init-$BRANCH"
    rm template.zip
    printLineWithColor $GREEN "Devops finally set up."
fi

printLineWithColor $GREEN "The template '$TEMPLATE_CHOICE' is ready to use in the project '$PROJECT_NAME'."
