//
//  LandmarkDetail.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/7/27.
//

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
        VStack {
            Image("phone7")
                .resizable()
                .frame(width: 250, height: 250, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 8){
                Text("天安门").font(.title)
                HStack{
                    Text("北京").font(.subheadline)
                    Spacer()
                    Text("北京市").font(.subheadline)
                }
            }
        }
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail()
    }
}
