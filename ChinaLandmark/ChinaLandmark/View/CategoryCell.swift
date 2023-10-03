//
//  CategoryCell.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/10/3.
//

import SwiftUI

struct CategoryCellItem: View {
    let item: Landmark
    //@ObservedObject: 全局环境变量绑定
    @ObservedObject var userData: UserData = UserData()
    
    var body: some View {
        NavigationLink(destination: LandmarkDetail(landmark: item, userData: userData)) {
            VStack(alignment: .leading){
                Image(item.imageName)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(height:150)
                    .clipped()
                    .cornerRadius(5)
                Text(item.name)
                    .font(.caption)
                    .foregroundStyle(.primary)
                    .foregroundColor(.primary)
            }
        }
    }
}


struct CategoryCell: View {
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
                        CategoryCellItem(item: item)
                    }
                }
            }
        }
        .padding(.trailing,12)
        .padding([.bottom,.top],8)
    }
}

#Preview {
    CategoryCell(cateName: categories.keys.sorted().first!)
}
