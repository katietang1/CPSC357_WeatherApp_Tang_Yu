//
//  Forecast.swift
//  WeatherApp_TangYu
//
//  Created by Katie Tang on 12/2/21.
//

import SwiftUI

struct Forecast: View {
    @StateObject var viewModel = WeatherViewModel()
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack{
                Text("Today's Forecast") //need to change to current date 
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Text(viewModel.timezone)
                    .font(.system(size: 25, weight: .medium, design: .default))
                    .foregroundColor(.white)
            VStack{
                Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height:180)
                Text(viewModel.temp)
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Text(viewModel.title)
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .foregroundColor(.white)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    Text("Switch Day Time")
                        .frame(width: 150, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.blue)
                        .background(Color("opacityBlue"))
                        .font(.system(size: 15))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Forecast_Previews: PreviewProvider {
    static var previews: some View {
        Forecast()
    }
}
