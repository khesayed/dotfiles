#!/usr/bin/env zsh

PLUGIN_DIR="$ZDOTDIR/plugins"
ZSHRC="$ZDOTDIR/.zshrc"

# Plugin name -> [repo, source file]
typeset -A repos
# typeset -A sources

repos=(
  "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions.git"
  "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"
)

mkdir -p "$PLUGIN_DIR"

for name in ${(k)repos}; do
  repo="${repos[$name]}"
  plugin_path="${PLUGIN_DIR}/${name}"

  if [[ ! -d "$plugin_path" ]]; then
    echo "Installing $name..."
    git clone --depth=1 "$repo" "$plugin_path"
  else
    echo "$name already exists. Skipping clone."
  fi

plugins_source="[[ -f \"\$ZDOTDIR/plugins/${name}/${name}.zsh\" ]] && source \"\$ZDOTDIR/plugins/${name}/${name}.zsh\""

if ! grep -Fqx "$plugins_source" "$ZSHRC"; then
  echo "# Source $name" >> "$ZSHRC"
  echo $plugins_source >> "$ZSHRC"
  echo "Added $name plugin source line to .zshrc"
  exec zsh
else
  echo "$name plugin already sourced in .zshrc"
fi


done
