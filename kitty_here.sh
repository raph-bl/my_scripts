#!/bin/bash

# Récupère la fenêtre active
ACTIVE_WINDOW=$(xdotool getactivewindow)

# Récupère le PID de la fenêtre
WINDOW_PID=$(xdotool getwindowpid $ACTIVE_WINDOW)

# Fonction pour trouver le répertoire
find_directory() {
    # Cherche dans tous les processus enfants
    for pid in $(pgrep -P $WINDOW_PID); do
        if [ -L "/proc/$pid/cwd" ]; then
            DIR=$(readlink "/proc/$pid/cwd")
            if [ -d "$DIR" ] && [ "$DIR" != "$HOME" ]; then
                echo "$DIR"
                return 0
            fi
        fi
    done

    # Si pas trouvé, essaie le processus parent
    if [ -L "/proc/$WINDOW_PID/cwd" ]; then
        readlink "/proc/$WINDOW_PID/cwd"
        return 0
    fi

    echo "$HOME"
}

DIR=$(find_directory)
kitty --directory="$DIR" &
