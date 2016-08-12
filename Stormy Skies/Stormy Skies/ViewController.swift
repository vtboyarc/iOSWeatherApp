//
//  ViewController.swift
//  Stormy Skies
//
//  Created by Adam Carter on 8/12/16.
//  Copyright © 2016 Adam Carter. All rights reserved.
//

import UIKit

extension CurrentWeather {
    var temperatureString: String {
        return "\(Int(temperature))º"
    }
    
    var humidityString: String {
        let percentagevalue = Int(humidity * 100)
        return "\(percentagevalue)%"
    }
    
    var precipitationProbabilityString: String {
        let percentagevalue = Int(precipitationProbability * 100)
        return "\(percentagevalue)%"
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let icon = WeatherIcon.PartlyCloudyDay.image
        let currentWeather = CurrentWeather(temperature: 56.0, humidity: 1.0, precipitationProbability: 1.0, summary: "Wet and rainy", icon: icon)
        
        display(currentWeather)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func display(weather: CurrentWeather) {
        currentTemperatureLabel.text = weather.temperatureString
        currentPrecipitationLabel.text = weather.precipitationProbabilityString
        currentHumidityLabel.text = weather.humidityString
        currentSummaryLabel.text = weather.summary
        currentWeatherIcon.image = weather.icon
    }
}
