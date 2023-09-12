# Projects in C#

All projects are CLI applications.

Some of these projects required generating a pseudo-random number. In the C# library is the `Random` class
than can be used to generate those numbers.

You should also know that each character has an ascii number. Those ascii number range from zero to 255. 
You can see the ascii number of a char by casting it to an int like this:

```
ch cha = 'a';
int cha_ascii = (int)chA; // this is called "casting"
Console.WriteLine(cha_ascii); // returns 97

int chA_ascii = 65;
ch chA = (char)chA_ascii;
Console.WriteLine(chA); // return 'A';
ch 
```

## Pig Dice

The game is played with one virtual die.

A game start with the score of zero and the roll of 1 die (dice).

If any number 2 thru 6 is rolled, that number is added to the game score and the die is rolled again.

As soon as the number 1 is rolled, the game is over and the score is whatever accumulated up to that roll.
The 1 is NEVER added to the score.

The highest score of any boot camp cohorts is 722.

## Password Generator

- variable number of upper & lower case letters (8 <= x <= 100)
- optional numbers
- optional symbols