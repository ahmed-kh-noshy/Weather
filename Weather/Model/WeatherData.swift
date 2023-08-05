//
//  WeatherData.swift
//  Weather
//
//  Created by ahmed khaled on 05/08/2023.
//

import Foundation

struct WeatherData: Codable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
