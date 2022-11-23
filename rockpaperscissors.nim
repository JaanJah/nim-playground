import std/strutils
import std/os
import std/random

randomize()

type
    Choice = enum rock, paper, scissors
    Result = enum win, draw, lose
    YesNo = enum yes, no

const choices = @[rock, paper, scissors]

proc readInput(): Choice =
    echo "(R)ock, (p)aper or (s)cissors?"
    while true:
        case toLower(readLine(stdin))
        of "rock", "r":
            echo "You picked rock!"
            return rock
        of "paper", "p":
            echo "You picked paper!"
            return paper
        of "scissors", "s":
            echo "You picked scissors!"
            return scissors
        else:
            echo "Option doesn't exist, pick 'r','p' or 's'"

proc pickRandomChoice(): Choice =
    let pick = rand(2)
    return choices[pick]

proc getResult(user: Choice, cpu: Choice): Result =
    if user == cpu:
        return draw
    
    # Rock vs Paper and Scissors
    if user == rock:
        if cpu == scissors:
            return win
        else:
            return lose

    # Paper vs Rock and Scissors
    if user == paper:
        if cpu == rock:
            return win
        else:
            return lose
    
    # Scissors vs Paper and Rock
    if user == scissors:
        if cpu == paper:
            return win
        else:
            return lose

proc playAgain(): YesNo =
    while true:    
        echo "Would you like to play again? (Y/N)"
        case toLower(readLine(stdin)):
        of "y":
            result = yes
            break
        of "n":
            result = no
            break
        else:
            echo "Invalid choice, pick (Y)es or (N)o"

while true:     
    let userChoice = readInput()

    echo "Rock.."
    sleep(300)
    echo "Paper.."
    sleep(300)
    echo "Scissors.."
    sleep(300)
    echo "Shoot!"
    sleep(100)

    let cpuChoice = pickRandomChoice()
    echo "You picked: ", userChoice, ", CPU picked: ", cpuChoice

    let result = getResult(userChoice, cpuChoice)
    if result == win:
        echo "You win!"
    elif result == draw:
        echo "It's a draw!"
    else:
        echo "You lost!"

    let playAgain = playAgain()
    if playAgain == yes:
        continue
    else:
        break
