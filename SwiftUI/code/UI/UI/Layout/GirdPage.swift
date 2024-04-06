//
//  GirdPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/6.
//

import SwiftUI

struct GirdPage: View {
    @State var allArr: NSArray = [
        [
            "image": "gen_1",
            "name": "Classical",
            "songs": "56 Songs"
        ],
        [
            "image": "gen_2",
            "name": "Pop",
            "songs": "80 Songs"
        ],
        [
            "image": "gen_3",
            "name": "Hip-Hop",
            "songs": "56 Songs"
        ],
        [
            "image": "gen_4",
            "name": "Rock",
            "songs": "120 Songs"
        ],
        [
            "image": "gen_5",
            "name": "Soul and R&B",
            "songs": "99 Songs"
        ],
        [
            "image": "gen_6",
            "name": "Instrumental",
            "songs": "140 Songs"
        ],
        
        [
            "image": "gen_7",
            "name": "Jazz",
            "songs": "70 Songs"
        ],
        [
            "image": "gen_8",
            "name": "Country Music",
            "songs": "80 Songs"
        ]
    ]

    var columnGrid = [ GridItem( .flexible(), spacing: 15 ), GridItem(.flexible(), spacing: 15) ]

    var body: some View {
        ScrollView {
            
            LazyVGrid(columns: columnGrid, spacing: 15) {
                ForEach(0 ..< allArr.count) { index in
                    GenreCell(pObj: (allArr[index] as? NSDictionary ) ?? [:])
                }
            }
            .padding(15)
        }
        .background(.black)
        .padding(.bottom, 40)
    }
}

#Preview {
    GirdPage()
}


struct GenreCell: View {
    var pObj: NSDictionary = [:]
    var body: some View {
        ZStack {
            Image(systemName: "arrowtriangle.backward.square")
                .resizable()
                .scaledToFill()
            
            VStack(alignment: .center) {
                Text(pObj.value(forKey: "name") as? String ?? "" )
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                
                Text(pObj.value(forKey: "songs") as? String ?? "" )
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
            .padding(8)
        }
        .background(.red)
    }
}
