//
//  ViewController.swift
//  Weather
//
//  Created by ahmed khaled on 04/08/2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var weatherManager = WeatherManager()
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func searchButton(_ sender: UIButton) {
        searchTextField.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == "" {
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
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }
}

