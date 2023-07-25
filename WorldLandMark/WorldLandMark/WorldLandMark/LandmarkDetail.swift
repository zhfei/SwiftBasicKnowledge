//
//  LandmarkDetail.swift
//  WorldLandMark
//
//  Created by zhoufei on 2023/7/25.
//

import SwiftUI

struct LandmarkDetail: View {
    
    let landmark:Landmark
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("pic5")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
            .navigationBarTitle(Text("自由女神像"),displayMode: NavigationBarItem.TitleDisplayMode.inline)
            
            Text("纽约")
                .foregroundColor(.secondary)
                .font(.largeTitle)
                .padding()
        }
            
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkDetail(landmark: landmarks[0])
        }
        
    }
}
