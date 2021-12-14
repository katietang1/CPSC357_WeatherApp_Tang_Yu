//
//  ClothingData.swift
//  WeatherApp_TangYu
//
//  Created by Katie Tang on 12/9/21.
//

import Foundation
import UIKit
import SwiftUI

var clothingData: [Clothing] = loadJson("ClothingData.json")

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}

//need working function(s) to save clothing data to json (adding, deleting)
//https://dev.to/arnavmotwani/handling-persistent-data-in-swiftui-2-0-with-json-1h7
// maybe the link above will help?
