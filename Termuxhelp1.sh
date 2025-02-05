#!/bin/bash

# Definir o diretório base
BASE_DIR=~/Gauch

# Função para criar diretórios de forma robusta
create_dir() {
  DIR_PATH="$1"
  
  # Forma 1: Usando mkdir
  mkdir -p "$DIR_PATH" 2>/dev/null && echo "mkdir: $DIR_PATH criado" && return
  echo "mkdir falhou para $DIR_PATH"

  # Forma 2: Usando install
  install -d "$DIR_PATH" 2>/dev/null && echo "install: $DIR_PATH criado" && return
  echo "install falhou para $DIR_PATH"

  # Forma 3: Usando touch (criando arquivos para garantir diretórios)
  touch "$DIR_PATH/.gitkeep" 2>/dev/null && echo "touch: $DIR_PATH criado" && return
  echo "touch falhou para $DIR_PATH"

  # Forma 4: Usando Python
  python3 -c "import os; os.makedirs('$DIR_PATH', exist_ok=True)" 2>/dev/null && echo "Python: $DIR_PATH criado" && return
  echo "Python falhou para $DIR_PATH"
}

# Criar estrutura de diretórios
create_dir "$BASE_DIR/Gnome-Packages/extensions"
create_dir "$BASE_DIR/Gnome-Packages/themes"
create_dir "$BASE_DIR/Gnome-Packages/icons"
create_dir "$BASE_DIR/Gnome-Packages/packages"

echo "Script finalizado. Verifique se os diretórios foram criados corretamente."
