//
//  Clothing.swift
//  WeatherApp_TangYu
//
//  Created by Katie Tang on 12/9/21.
//

import Foundation
import SwiftUI

// type Character attributes
struct Clothing: Codable, Identifiable {
    var id: String
    var name: String
    
    var clothingType: String
    var description: String
    var weatherType: String
    
    var imageName: String
}
