//
//  ImageView.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI

struct ImageView: View {
    
    @State private var source: UIImage? = nil
    private var placeImage = UIImage(named: "logo")
    
    var body: some View {
        VStack(spacing: 10) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            Image(uiImage: source ?? placeImage!)
                .resizable()
                .scaledToFit()
                .onAppear(perform: downloadImage)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    print("预览")
                }

        }
    }
    
    func downloadImage() {
        guard let url = URL(string: "https://a.520gexing.com/uploads/allimg/2023082316/exvixwxk0p41.jpg") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data, let image = UIImage(data: data) else { return }
            self.source = image
        }.resume()
    }
}

#Preview {
    ImageView()
}
