//
//  Home.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/9/30.
//

import SwiftUI

struct Home: View {
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: {$0.category})
    }
    
    var body: some View {
        NavigationView {
            List {
                Image("phone8")
                    .resizable()
                    .scaledToFill()
                    .frame(height:200)
                    .clipped()
                    .listRowInsets(EdgeInsets.init())
                
                ForEach(Range(NSRange(location: 0, length: categories.keys.count))!) { index in
                    let cateName = categories.keys.sorted()[index]
                    CategoryCell(cateName: cateName)
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(Visibility.hidden)
                
                NavigationLink(destination: LandmarkList()) {
                    Text("查看所有地标")
                }
                .listRowInsets(EdgeInsets.init())
            }
            .navigationTitle("精选")
        }
        
    }
}

#Preview {
    Home()
}
