if [ ! -d "$HOME/notes" ]; then
    echo "Cloning notes repository..."
    git clone git@github.com:spiderbites/notes.git "$HOME/notes"
fi 
