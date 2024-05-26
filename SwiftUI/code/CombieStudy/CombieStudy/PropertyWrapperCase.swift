//
//  PropertyWrapperCase.swift
//  CombieStudy
//
//  Created by Tao Yu on 2024/4/19.

// 货币间的转换:
@propertyWrapper
struct Converter {
    // 货币的名称from
    let from: String
    // 货币的名称to
    let to: String
    // 汇率
    let rate: Double
    var value: Double
    var wrappedValue: String {
        get { "\(from) \(value)" }
        set { value = Double(newValue) ?? -1 }
        
    }
    var projectedValue: String {
        return "\(to) \(value * rate)"
    }
    
    init(initialValue: String, from: String, to: String, rate: Double) {
        self.rate = rate
        self.value = 0
        self.from = from
        self.to = to
        self.wrappedValue = initialValue
    }
}



import SwiftUI

struct ConverterView: View {
    @Converter(initialValue: "100", from: "USD", to: "CNY", rate: 6.88) var usd_cny

    @Converter(initialValue: "100", from: "CNY", to: "EUR", rate: 0.13) var cny_eur
    mutating func appear() {
        print(usd_cny, $usd_cny)
        print(cny_eur, $cny_eur)
        
        // USD 100.0 = CNY 688.0 !"
        // CNY 100.0 = EUR 13.0

        usd_cny = "324.3"
        print($usd_cny)
        
    }
    
    var body: some View {
        VStack {
            Text("转换测试")
        }.onAppear {
            self.appear()
        }
    }
}

#Preview {
    ConverterView()
}





