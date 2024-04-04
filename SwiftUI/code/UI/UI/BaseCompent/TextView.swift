//
//  TextView.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
            Text("独行文字")
            Text("有属性的文字-阴影")
                .foregroundColor(.orange)
                .font(.largeTitle)
                .fontWeight(.medium)
                .italic()
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: 0, y: 2)
            
            Text("下划线点击").underline(true, color: .black)
                .onTapGesture {
                    print("下划线点击")
                }
            
            HStack(alignment: .center, spacing: 5) {
                Text("左")
                Text("中").font(.largeTitle)
                Text("右").bold()
            }
            Text("这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行这是一个多行文字换行").lineLimit(nil)
            
        }
    }
}

#Preview {
    TextView()
}

