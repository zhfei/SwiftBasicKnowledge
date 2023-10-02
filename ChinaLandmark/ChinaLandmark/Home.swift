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
                    Text(cateName)
                    
                    let list = categories[cateName]
                    ScrollView.init(.horizontal) {
                        ForEach(list!) { item in
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height:150)
                                .clipped()
                        }
                        
                    }
                    
                }
                
                
                
                NavigationLink(destination: LandmarkList()) {
                    Text("查看所有地标")
                }
            }.navigationTitle("精选")
        }
        
    }
}

#Preview {
    Home()
}
