# Weather App

## Overview
This is a simple Weather App built using **SwiftUI** that fetches real-time weather data from the **OpenWeatherMap API**. Users can enter a city name to retrieve the current weather details, including temperature and weather conditions.

## Features
- **Fetch real-time weather data** based on the city name.
- **Displays temperature, city name, and weather description**.
- **Error handling** for invalid responses or network issues.
- **Loading indicator** while fetching data.
- **User-friendly UI** built using SwiftUI components.

## Technologies Used
- **SwiftUI** for UI development.
- **Combine framework** for state management.
- **URLSession** for network requests.
- **OpenWeatherMap API** as the data source.

## How It Works
1. The user enters a city name in the text field.
2. When the "Fetch Weather Data" button is clicked, a network request is sent to the OpenWeatherMap API.
3. The response is processed, and the weather details are displayed.
4. If there is an error (e.g., invalid city name, network issue), an error message is shown.

## Installation & Usage
1. **Clone the repository**:
   ```sh
   git clone https://github.com/your-username/weather-app.git
   ```
2. **Open the project in Xcode**.
3. **Run the app on the simulator or a physical device**.
4. **Enter a city name** and press the button to fetch weather data.

## API Configuration
- The app uses the **OpenWeatherMap API**.
- Replace the API key in `ViewModel.swift` with your own key:
  ```swift
  let apiKey = "your_api_key_here"
  ```
- You can obtain an API key from [OpenWeatherMap](https://openweathermap.org/api).
