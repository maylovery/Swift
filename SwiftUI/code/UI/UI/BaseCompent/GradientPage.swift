//
//  GradientPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/7.
//

import SwiftUI

struct GradientPage: View {
    var body: some View {
        VStack {
            //图形渐变
            //角渐变
            AngularGradient(gradient: Gradient(colors: [Color.red, Color.blue,.purple,.red]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            //椭圆
            EllipticalGradient(colors:/*@START_MENU_TOKEN@*/[Color.blue, Color.green]/*@END_MENU_TOKEN@*/, center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadiusFraction: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, endRadiusFraction: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)

            //线性
            LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                
            //辐射渐变
            RadialGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, center: .bottomLeading, startRadius: 100, endRadius: 120)
        }
    }
}

#Preview {
    GradientPage()
}
