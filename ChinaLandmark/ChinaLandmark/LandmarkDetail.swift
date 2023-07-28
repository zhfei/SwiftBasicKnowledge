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
            MapView()
                .edgesIgnoringSafeArea(Edge.Set.top)
                .frame(height:350)
            
            
            Image("phone7")
            //尺寸
                .resizable()
                .frame(width: 250, height: 250, alignment: .center)
            //圆角
                .clipShape(Circle())
            //描边
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
            //阴影
                .shadow(radius: 10)
            //偏移
                .offset(x: 0, y: -100)
            //内边距
                .padding(Edge.Set.bottom, -100)
            
            VStack(alignment: .leading, spacing: 8){
                Text("天安门").font(.title)
                HStack{
                    Text("北京").font(.subheadline)
                    Spacer()
                    Text("北京市").font(.subheadline)
                }
            }
            Spacer()
        }.navigationBarTitle(Text("天安门"),displayMode: NavigationBarItem.TitleDisplayMode.inline)
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LandmarkDetail()
        }
        
    }
}
