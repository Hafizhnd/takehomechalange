# Rick & Morty Flutter App

## Introduction :
A Flutter application that uses the Rick and Morty API to display a list of characters, their details, and allows users to search and save favorite characters.  
The app is built using Clean Architecture principles and Provider as the state management solution.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Libraries](#libraries)
- [Project Structure](#project-structure)
- [APK Link](#apk-link)

## Features :
- Display list of characters grouped by location
- Show character detail page (name, species, gender, origin, location, image)
- Search characters with real-time search (results update as user types)
- Add or remove characters from favorites (stored in SQLite database)
- Bottom navigation bar for Home, Search, and Favorites
- Pagination with background loading for all characters
- Unit tests using Mockito (3 test cases for provider & repository)

## Libraries :
- Flutter (version X.X.X)
- Provider (State Management)
- http (API Client)
- sqflite (Local Database)
- path_provider (For SQLite path)
- mockito (Unit Testing)
- flutter_launcher_icons (App Icon Customization)

## Project Structure :
* `core` → Constants, error handling  
* `data` → Data sources & repository implementation  
  * `datasources` → Remote & local data sources  
  * `models` → API response models  
  * `repositories` → Repository implementation  
* `domain` → Entities & repository contracts  
* `presentation` → UI (pages, widgets, providers)  
  * `pages` → Home, Search, Detail, Favorites  
  * `providers` → Home, Detail, Favorites, Search  
* `main.dart` → App entry point  

## APK Link :
[Download APK](https://drive.google.com/file/d/1XBO5zLKVTXZ_bLOfkzw-y1n8H1XhNgl9/view?usp=sharing)
