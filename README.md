Weather App 🌤️

A Flutter-based Weather App that allows users to check the current weather and forecast for any city. This app displays real-time weather information including temperature, humidity, pressure, wind speed, and forecasts every 3 hours.

Features ✨

Search by City: Users can enter any city to get current weather information.

Current Weather:

Temperature

Humidity

Pressure

Wind Speed

3-Hour Forecast: Displays weather predictions for the upcoming hours.

Simple and Intuitive UI: Easy-to-use interface built using Flutter widgets.

Screenshots 📸
<img width="345" height="658" alt="Screenshot 2025-09-09 204002" src="https://github.com/user-attachments/assets/58741b61-0389-4aec-a183-77f3dd374b71" />
<img width="355" height="649" alt="Screenshot 2025-09-09 204047" src="https://github.com/user-attachments/assets/0487d220-48ad-46f7-b458-a59f2bea4365" />

Home Screen

3-Hour Forecast Screen

Getting Started 🚀
Prerequisites

Flutter
 installed

Android Studio
 or VS Code with Flutter plugin

Internet connection (for fetching weather data)

Installation

Clone the repository:

git clone https://github.com/AbhiramMalyala/weather-app.git


Navigate to the project directory:

cd weather-app


Install dependencies:

flutter pub get


Run the app on an emulator or physical device:

flutter run

API Key Setup 🔑

This app uses OpenWeatherMap API for weather data.

Sign up at OpenWeatherMap
 and get your API key.

Create a secret.dart file in the lib/ folder and add your API key:

const String Api_key = "YOUR_API_KEY_HERE";


Make sure this file is not pushed to public repositories.

Project Structure 🗂️
lib/
├── main.dart          # Entry point of the app
├── secret.dart        # API key file
├── api_data.dart      # API calls and data fetching
├── screens/
│   ├── home_screen.dart
│   └── forecast_screen.dart
└── widgets/
    └── weather_card.dart

Dependencies 📦

http – For making API calls

flutter/material.dart – For UI components

intl – For date and time formatting (optional)

Usage 💡

Open the app.

Enter the city name in the search field.

View current weather and 3-hour forecasts.

Future Enhancements 🌟

Add geolocation to get weather automatically for current location.

Support for dark mode.

Show weather icons for each forecast.

Include weekly forecast view.
