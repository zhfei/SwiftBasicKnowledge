//
//  ContentView.swift
//  SwiftUIBase
//
//  Created by zhoufei on 2023/11/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, world!")
                .frame(width: 200, height: 100)
                .border(.red)
            Text("Hello, jack!")
                .frame(width: 300, height: 50)
                .border(.green)
        }
        .border(.blue)
        .padding()
        .bold()
    }
}

#Preview {
    ContentView()
}
