//
//  ContentView.swift
//  ThisInBeijing
//
//  Created by zhoufei on 2023/11/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
            Text("Hello, world!")
                .fontWeight(.heavy)
        }
        .padding()
    }
}

#Preview {
    ContentView()
//        .previewDevice("iPhone 14")
//        .previewLayout(.fixed(width: 200, height: 100))
        .previewDisplayName("iPhone 14")
}
