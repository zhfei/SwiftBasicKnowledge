//
//  LandmarkListCell.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/7/29.
//

import SwiftUI

struct LandmarkListCell: View {
    let landmark: Landmark
    var body: some View {
        HStack{
            Image(landmark.imageName)
            //尺寸
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .cornerRadius(8)
            
            Text(landmark.city)
            Spacer()
            if landmark.isFeatured {
                Image("icon_rcxinhua_selected")
                    .resizable().frame(width: 20, height: 20, alignment: .center)
            }
        }
    }
}



struct LandmarkListCell_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LandmarkListCell(landmark: landmarks[0])
            LandmarkListCell(landmark: landmarks[1])
        }.previewLayout(PreviewLayout.fixed(width: 320, height: 80))
        
    }
}
