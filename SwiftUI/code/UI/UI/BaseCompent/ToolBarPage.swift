//
//  ToolBarPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/7.
//

import SwiftUI

struct ToolBarPage: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            Text("Hello World!")
                .navigationTitle("navigation")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Edit") {}
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("back") {
                            dismiss.callAsFunction()
                        }
                    }
                }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ToolBarPage()
}
