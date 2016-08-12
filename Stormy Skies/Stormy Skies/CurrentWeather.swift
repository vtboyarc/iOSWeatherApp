//
//  CurrentWeather.swift
//  Stormy Skies
//
//  Created by Adam Carter on 8/12/16.
//  Copyright © 2016 Adam Carter. All rights reserved.
//

import Foundation
import UIKit

//naming these values after what is available from the forecast.io API
struct CurrentWeather {
    let temperature: Double
    let humidity: Double
    let precipitationProbability: Double
    let summary: String
    let icon: UIImage
}