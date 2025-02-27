# Q3: Stoplight Game

## stoplight_game.sh
```bash
#!/bin/bash

# Stoplight Game illustrating Nash Equilibrium
choices=("Stop" "Go")

player1=${choices[$RANDOM % 2]}
player2=${choices[$RANDOM % 2]}

echo "Player 1 choice: $player1"
echo "Player 2 choice: $player2"

if [ "$player1" == "Stop" ] && [ "$player2" == "Stop" ]; then
    echo "Both stopped: Safe but no progress. (Nash Equilibrium)"
elif [ "$player1" == "Go" ] && [ "$player2" == "Go" ]; then
    echo "Both went: Crash!"
elif [ "$player1" == "Stop" ] && [ "$player2" == "Go" ]; then
    echo "Player 1 stopped, Player 2 went: Player 2 wins."
else
    echo "Player 2 stopped, Player 1 went: Player 1 wins."
fi
```

---