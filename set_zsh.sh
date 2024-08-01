#!/bin/bash
## ----------------------------------
# Colors
# ----------------------------------
NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'
# ----------------------------------
# Vars
# ----------------------------------
ZSH_FOLDER=~/.oh-my-zsh
ZSH_PLUGINS=$ZSH_FOLDER/custom/plugins
ZSH_HSS="zsh-history-substring-search"
ZSH_SYH="zsh-syntax-highlighting"
ZSH_ATS="zsh-autosuggestions"
ZSH_P10="powerlevel10k"

sudo apt -y install zsh

if [[ -d $ZSH_FOLDER ]]
then
	echo -e "${LIGHTBLUE}=========== 'Oh-My-ZSH' já está instalado!${NC}"
else
	echo -e "${LIGHTGREEN}========== Instalando 'Oh-My-ZSH'...${NC}"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
if [[ -d $ZSH_PLUGINS/$ZSH_HSS ]]
then
	echo -e "${LIGHTBLUE}=========== Plugin '$ZSH_HSS' já instalado!${NC}"
else
	echo -e "${LIGHTGREEN}========== Instalando plugin '$ZSH_HSS'...${NC}"
	git clone https://github.com/zsh-users/$ZSH_HSS ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$ZSH_HSS
fi
if [[ -d $ZSH_PLUGINS/$ZSH_SYH ]]
then
	echo -e "${LIGHTBLUE}=========== Plugin '$ZSH_SYH' já instalado!${NC}"
else
	echo -e "${LIGHTGREEN}========== Instalando plugin '$ZSH_SYH'...${NC}"
	git clone https://github.com/zsh-users/$ZSH_SYH.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$ZSH_SYH
fi
if [[ -d $ZSH_PLUGINS/$ZSH_ATS ]]
then
	echo -e "${LIGHTBLUE}=========== Plugin '$ZSH_ATS' já instalado!${NC}"
else
	echo -e "${LIGHTGREEN}========== Instalando plugin '$ZSH_ATS'...${NC}"
	git clone https://github.com/zsh-users/$ZSH_ATS ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$ZSH_ATS
fi
if [[ -d $ZSH_PLUGINS/k ]]
then
	echo -e "${LIGHTBLUE}=========== Plugin 'k' já instalado!${NC}"
else
	echo -e "${LIGHTGREEN}========== Instalando plugin 'k'...${NC}"
	git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k
fi
if [[ -d $ZSH_FOLDER/custom/themes/powerlevel10k ]]
then
	echo -e "${LIGHTBLUE}=========== Tema 'powerlevel10k' já instalado!${NC}"
else
	echo -e "${LIGHTGREEN}========== Instalando tema 'powerlevel10k'...${NC}"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
if [[ `diff zshrc ~/.zshrc` ]]
then
	echo -e "${LIGHTGREEN}========== Copiando arquivo .zshrc...${NC}"
	cp zshrc ~/.zshrc -b --suffix='.ORI'
else
	echo -e "${LIGHTBLUE}=========== Arquivo '.zshrc' já copiado!${NC}"
fi
if [[ ! -f ~/.p10k.zsh || `diff p10k.zsh ~/.p10k.zsh` ]]
then
	echo -e "${LIGHTGREEN}========== Arquivo '.p10k.zsh' não existe ou é diferente do desejado! Copiando arquivo...${NC}"
	cp p10k.zsh ~/.p10k.zsh -b --suffix='.ORI'
else
	echo -e "${LIGHTBLUE}=========== Arquivo '.p10k.zsh' já copiado!${NC}"
fi
