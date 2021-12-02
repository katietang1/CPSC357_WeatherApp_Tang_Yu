//
//  Forecast.swift
//  WeatherApp_TangYu
//
//  Created by Katie Tang on 12/2/21.
//

import SwiftUI

struct Forecast: View {
    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        VStack{
            Text("Forecast yasss")
            Text(viewModel.timezone)
                .font(.system(size: 32))
            Text(viewModel.temp)
                .font(.system(size: 44))
            Text(viewModel.title)
                .font(.system(size: 24))
        }
    }
}

struct Forecast_Previews: PreviewProvider {
    static var previews: some View {
        Forecast()
    }
}
