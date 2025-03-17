//
//  WeatherView.swift
//  M1_W3_D2
//
//  Created by Taibah Valley Academy on 3/17/25.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject private var viewModel = ViewModel()
    @State private var city: String = "London"
    @State private var hasLoadedData = false
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).edgesIgnoringSafeArea(.all)
            
            if viewModel.isLoading{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            } else {
                VStack(spacing: 30) {
                    TextField("Enter City Name", text: $city)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Fetch Weather Data"){
                        viewModel.fetchWeather(for: city)
                    }
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    } else {
                        Text(viewModel.cityName)
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        
                        Text(viewModel.temperature)
                            .font(.title)
                            .bold()
                            .padding()
                        
                        Text(viewModel.description)
                            .font(.title2)
                            .padding()
                    }
                }
                .padding()
                .onAppear {
                    if !hasLoadedData {
                        viewModel.fetchWeather(for: city)
                        hasLoadedData = true
                    }
                }
            }
        }
    }
}

#Preview {
    WeatherView()
}
