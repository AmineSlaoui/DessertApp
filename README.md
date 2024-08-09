# Dessert App

## Overview

This app was developed using Swift and Swift UI. It allows user to browse through a collection of dessert recipes fetched from TheMealDB API. Users can view a list of desserts, select one and get detailed information.

## Installation

### Prerequisite

- Latest version of Xcode

### Setup

1. Clone the repo
   ```
   git clone https://github.com/AmineSlaoui/DessertApp
   cd "Fetch Challenge"
   ```
2. Open project in Xcode
3. Build and run project

## Architecture

The app follows the MVVM (Model-View-ViewModel) architectural pattern.

- MealsModel contains the data structure, representing information about meals
- ViewModel is responsible for handling the business logic of the app, including making API calls, processing data, and updating the View with the necessary information.
- View where SwiftUI was used to display the user interface 

## API

The app uses TheMealDB API to fetch dessert data. Two endpoints are used:
1. List of meals
   * Endpoint: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert "
2. Recipe details
   * Endpoint: "https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID"



