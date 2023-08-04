//
//  WeatherManager.swift
//  Weather
//
//  Created by ahmed khaled on 04/08/2023.
//

import Foundation


struct WeatherManager {
    
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=dda73d433a00f047e25b245c64420f3a"
    
    func fetchWheather(cityName: String){
       let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
