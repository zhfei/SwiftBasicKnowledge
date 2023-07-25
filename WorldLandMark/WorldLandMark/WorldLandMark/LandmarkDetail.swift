//
//  LandmarkDetail.swift
//  WorldLandMark
//
//  Created by zhoufei on 2023/7/25.
//

import SwiftUI

struct LandmarkDetail: View {
    /*
     添加动画的方式有3种：
     1.全局范围的withAnimation,只要是被它声明包裹的@State双向绑定属性，都会带动画
     2.具体标签上的transition(.move(edge: .trailing)),处理移动
     3.具体标签上的animation(.default, value: 1),处理旋转，缩放
     @State:双向绑定属性，用于声明语言中，和Vue，React的双向绑定是相似的。
     */
    let landmark:Landmark
    @State var zoomed = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("pic5")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                .navigationBarTitle(Text("自由女神像"),displayMode: NavigationBarItem.TitleDisplayMode.inline)
                .onTapGesture {
                    //全局的方式添加动画：表示凡是使用这个@State双向绑定变量的地方都会带动画（可能在屏幕刷新时自动使用插值的方式逐个变动）
                    withAnimation(.default){
                        self.zoomed.toggle()
                    }
                }
            
            if !zoomed {
                Text("纽约")
                    .foregroundColor(.secondary)
                    .font(.largeTitle)
                    .padding()
                    .transition(.move(edge: .trailing))
            }
            
        }
            
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView {
                LandmarkDetail(landmark: landmarks[0])
            }
            NavigationView {
                LandmarkDetail(landmark: landmarks[0])
            }
        }
        
        
    }
}
