//
//  ContentView.swift
//  FirstApp
//
//  Created by zhoufei on 2023/11/2.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    
    // MARK: Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20) {
                ForEach(0..<7) { item in
                    CardView(cardData: cardData[item])
                }
            }
            .padding(20)
        }
    }
}

// MARK: Preview
#Preview {
    ContentView()
}
