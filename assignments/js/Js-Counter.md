# Js-Counter

The goal of this assignment is to create a web page that acts as a counter by allowing the user to click one of two buttons.

## Stage 1

The page will contain two buttons and an input box. The input box starts with the number zero. On the left is a button that has a minus sign. On the right of the input control is a button that has a plus sign. The input control is read only and cannot be changed by the user except by clicking either button. 

When either button is clicked, the number in the input box will increase or decrease by one and is redisplayed in the input box. If the number becomes negative, it should display with a minus sign (i.e. -5).

## Stage 2

In this stage, you will change the style of the number based on its value. Here are the rules:

    If the number if evenly divisible by 2
        then display the number in red text

    If the number if evenly divisible by 3
        then display the number in bold text

    If the number if evenly divisible by 5
        then display the number in italic text

The rules are cummulative meaning the number 6 should display in both red and bold. If the number matches none of the rules, it should display in black not bold or italic.