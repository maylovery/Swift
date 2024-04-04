//
//  WebView.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI
import WebKit

struct WebView: View {
    var body: some View {
        WebPage(url: URL(string: "https://www.phpcms9.com/news/ai-hui-hua-de-xian-dai-mei-nv-qing-kong-zhi-hao-xin-tiao-qian-wan-bu-yao-lun-xian-le.html")!)
    }
}

#Preview {
    WebView()
}

struct WebPage: UIViewRepresentable {
    let url: URL
    func makeUIView(context: Context) -> WKWebView {
        let web = WKWebView()
        web.load(URLRequest(url: url))
        return web
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
