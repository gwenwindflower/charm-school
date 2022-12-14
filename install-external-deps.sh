starship() {
    if [[ -v $CODESPACES ]]; then
        echo "Installing starship prompt..."
        curl -sS https://starship.rs/install.sh | zsh
    fi
}
starship