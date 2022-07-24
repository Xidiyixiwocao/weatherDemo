//
//  CityCell.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/20.
//

import SwiftUI
import Kingfisher
struct CityCell: View {
    let expanded: Bool
    let model:CityWeatherViewModel
    var body: some View {
        VStack{
            HStack{
                KFImage(model.iconImageURL)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 4)
                Spacer()
                VStack(alignment: .trailing){
                    Text(model.cityName)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, 12)
            Spacer()
            HStack(spacing: expanded ? 20 : -30){
                Spacer()
                Text(model.mainDes).modifier((ToolButtonModifier()))
                Text(String(model.temp)).modifier((ToolButtonModifier()))
            }
            .padding(.bottom, 12)
            .opacity(expanded ? 1.0 : 0.0)
            .frame(maxHeight: expanded ? .infinity : 0)
        }
        .frame(height: expanded ? 120 : 80)
        .padding(.leading, 23)
        .padding(.trailing, 15)
        .background(
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                      .stroke(model.color, style: StrokeStyle(lineWidth: 4))
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(gradient:Gradient(colors: [.white, model.color]), startPoint: .leading, endPoint: .trailing)
                    )
            }
            
        )
        .padding(.horizontal)
    }
}
struct ToolButtonModifier: ViewModifier { func body(content: Content) -> some View {
    content
      .font(.system(size: 25))
      .foregroundColor(.white)
      .frame(width: 100, height: 40)
}
}
struct CityCell_Previews: PreviewProvider {
    static var previews: some View {
        Text("aa")
//        CityCell(expanded: true, model: CityWeatherViewModel(city: CityWeather(cityName:"Berlin")))
       
    }
}

