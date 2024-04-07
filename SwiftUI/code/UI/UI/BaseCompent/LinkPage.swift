//
//  LinkPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/7.
//

import SwiftUI

struct LinkPage: View {
    var body: some View {
        VStack {
            //开浏览器
            Link(destination: URL(string:"https://www.baidu.com/")!) {
                Text("Link")
            }
            
            Link("View Our Terms of Service",
                 destination: URL(string: "https://www.example.com/TOS.html")!)
            
            Link("Visit Our Site", destination: URL(string: "https://www.example.com")!)
                .environment(\.openURL, OpenURLAction { url in
                    print("Open \(url)")
                    return .handled
                })
        }
    }
}

#Preview {
    LinkPage()
}
