//
//  ModalPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/5.
//

import SwiftUI

#Preview {
    ModalPage()
}

struct ModalPage: View {
    @State private var showDialog = false
    var body: some View {
        Button("Show Modal") {
            showDialog = true
        }
        .sheet(isPresented: $showDialog) {
            ModalView()
        }
    }
}

fileprivate struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("This is a modal view.")
                .padding()
            
            Button("Tap-Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
