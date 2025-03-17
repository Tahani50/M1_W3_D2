//
//  ViewModel.swift
//  M1_W3_D2
//
//  Created by Taibah Valley Academy on 3/17/25.
//

import Foundation

extension WeatherView{
    
    class ViewModel: ObservableObject{
        
        @Published var cityName: String = ""
        @Published var temperature: String = "--"
        @Published var description: String = ""
        @Published var errorMessage: String? = nil
        @Published var isLoading: Bool = false
        
        func fetchWeather(for city: String) {
            let apiKey = "b4dc543eb89e8a3aec370d2259105230"
            let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
            
            guard let url = URL(string: urlString) else {
                DispatchQueue.main.async {
                    self.errorMessage = "Invalid URL"
                }
                return
            }
            
            isLoading = true
            
            print("\n---------------------------------------------------------------------")
            print("URL: \(url)")
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                
                if let error = error {
                    DispatchQueue.main.async {
                        self.errorMessage = "Network Error: \(error.localizedDescription)"
                    }
                    print(error.localizedDescription)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    DispatchQueue.main.async {
                        self.errorMessage = "Invalid response from server"
                    }
                    print("Invalid response")
                    return
                }
                
                print("\n---------------------------------------------------------------------")
                print("Status Code: \(httpResponse.statusCode)")
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        self.errorMessage = "No data returned from server"
                    }
                    print("No data")
                    return
                }
                
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON String: \n\(jsonString)")
                    print("---------------------------------------------------------------------")
                }
                
                do{
                    let decodedResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.cityName = decodedResponse.name
                        self.temperature = "\(decodedResponse.main.temp)C"
                        self.description = decodedResponse.weather.first?.description.capitalized ?? "No description"
                        self.errorMessage = nil
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = "Error parsing JSON: \(error.localizedDescription)"
                    }
                    print("JSON parsing error: \(error.localizedDescription)")
                }
            }.resume()            
        }
    }
}
