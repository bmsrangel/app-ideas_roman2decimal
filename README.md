# Roman to Decimal Converter

<p align="center">
    <img src="media/screen_capture.gif" width="300px">
</p>

## Description

This repository is a solution proposal for the [Roman to Decimal numbers Converter](https://github.com/florinpop17/app-ideas/blob/master/Projects/1-Beginner/Roman-to-Decimal-Converter.md) from App Ideas repository (the project description is indicated at the end).

There's not too much to explain: the app will receive a roman number as input and it will convert it to decimal numeric base. However, the application follow the rules associated to the conversion, so the user may see some errors if an invalid input is provided.

## Used libs

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [flutter_icons](https://pub.dev/packages/flutter_icons)

## Project Description (from original repository)

**Tier:** 1-Beginner

The numeric system represented by Roman numerals originated in ancient Rome and remained the
usual way of writing numbers throughout Europe well into the Late Middle Ages.
Roman numerals, as used today, employ seven symbols, each with a fixed integer value.

See the below table the _Symbol - Value_ pairs:

- I - 1
- V - 5
- X - 10
- L - 50
- C - 100
- D - 500
- M - 1000

### User Stories

- [x] User should be able to enter one Roman number in an input field
- [x] User could see the results in a single output field containing the decimal (base 10) equivalent of the roman number that was entered by pressing a button
- [x] If a wrong symbol is entered, the User should see an error

### Bonus features

- [ ] User could see the conversion to be made automatically as I type
- [ ] User should be able to convert from decimal to Roman (vice-versa)

### Useful links and resources

- [An explanation of Roman Numbers](https://en.wikipedia.org/wiki/Roman_numerals)

## Running the Project

Assuming Flutter is correctly installed and configured:

- Clone this repository
- Run the command `flutter pub get` in the project root to download the packages
- Start the application using either an emulator or a physical device
