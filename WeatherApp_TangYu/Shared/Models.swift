//
//  Models.swift
//  WeatherApp_TangYu
//
//  Created by Minna Yu on 11/28/21.
//

import Foundation

struct WeatherModel: Codable{
    let timezone: String
    let current: CurrentWeather
    
}

struct CurrentWeather: Codable{
    let temp: Float
    let weather: [WeatherInfo]
}

struct WeatherInfo: Codable{
    let main: String
    let description: String
}
