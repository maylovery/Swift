//
//  CustomeModiferView.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI

struct CustomeModiferView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .customText()
            
            Text("你好世界")
                .customText()            
        }
    }
}

#Preview {
    CustomeModiferView()
}

struct CustomeTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.blue)
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
    }
}

extension View {
    func customText() -> some View {
        self.modifier(CustomeTextStyle())
    }
}


