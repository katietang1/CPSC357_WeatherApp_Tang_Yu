//
//  ViewModels.swift
//  WeatherApp_TangYu
//
//  Created by Minna Yu on 11/28/21.
//

import Foundation

class WeatherViewModel: ObservableObject{
    @Published var title: String = "-"
    @Published var descriptionText: String = "-"
    @Published var temp: String = "-"
    @Published var timezone: String = "-"
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather(){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=33.78&lon=-117.85&units=imperial&exclude=hourly,daily&appid=067eb00beba0e0f544c2bc68efc6f100") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async{
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.descriptionText = model.current.weather.first?.description ?? "No Description"
                    self.temp = "\(model.current.temp)°"
                    self.timezone = model.timezone
                }
            }
            catch{
                print("Failed")
            }
        }
        task.resume()
    }
}
