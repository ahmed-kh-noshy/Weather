//
//  ViewController.swift
//  Weather
//
//  Created by ahmed khaled on 04/08/2023.
//

import UIKit
import CoreLocation
class WeatherViewController: UIViewController {

    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func searchButton(_ sender: UIButton) {
        searchTextField.endEditing(true)
        
    }
    
    @IBAction func locationButton(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        weatherManager.delegate = self
        searchTextField.delegate = self
    }
    
    
}

extension WeatherViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = "type some thing"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text{
            weatherManager.fetchWheather(cityName: city)
        }
        searchTextField.text = ""
    }
    
}

extension WeatherViewController: weatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
            }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension WeatherViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
