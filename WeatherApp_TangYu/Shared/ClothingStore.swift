//
//  ClothingStore.swift
//  WeatherApp_TangYu
//
//  Created by Katie Tang on 12/9/21.
//

import Foundation
import SwiftUI
import Combine

class ClothingStore : ObservableObject {
    @Published var clothing: [Clothing]
    
    init (clothing: [Clothing] = []) {
        self.clothing = clothing
    }
}
