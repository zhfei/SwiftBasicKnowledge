//
//  Home.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/9/30.
//

import SwiftUI

struct HomeCell: View {
    let cateName: String
    
    var body: some View {
        VStack(alignment:.leading){
            Text(cateName)
                .font(.headline)
            let list = categories[cateName]
            ScrollView.init(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(Range.init(0...10)) { index in
                        let item = list![index%2]
                        VStack(alignment: .leading){
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height:150)
                                .clipped()
                                .cornerRadius(5)
                            Text(item.name)
                                .font(.caption)
                        }
                    }
                }
            }
        }
        .padding(.trailing,12)
        .padding([.bottom,.top],8)
    }
}

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
                    HomeCell(cateName: cateName)
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
