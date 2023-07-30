//
//  LandmarkDetail.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/7/27.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    @ObservedObject var userData: UserData
    
    var userLandmarkIndex: Int {
        userData.userLandmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        VStack {
            MapView(landmark: landmark)
                .edgesIgnoringSafeArea(Edge.Set.top)
                .frame(height:350)
            
            
            Image(landmark.imageName)
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
                HStack {
                    Text(landmark.name).font(.title)
                    Button(action: {
                        self.userData.userLandmarks[self.userLandmarkIndex]
                            .isFeatured.toggle()
                    }){
                        if landmark.isFeatured {
                            Image("icon_rcxinhua_selected")
                                .resizable().frame(width: 20, height: 20, alignment: .center)
                        } else {
                            Image("icon_rcxinhua_defaultselected")
                                .resizable().frame(width: 20, height: 20, alignment: .center)
                        }
                    }
                    
                }
                HStack{
                    Text(landmark.city).font(.subheadline)
                    Spacer()
                    Text(landmark.proviance).font(.subheadline)
                }
            }.padding()
            Spacer()
        }.navigationBarTitle(Text(landmark.name),displayMode: NavigationBarItem.TitleDisplayMode.inline)
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LandmarkDetail(landmark: landmarks[0], userData: UserData())
        }
        
    }
}
