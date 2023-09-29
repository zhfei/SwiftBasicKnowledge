//
//  HikeView.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/9/25.
//

import SwiftUI

struct HikeView: View {
    @State private var isSelected = false
    
    fileprivate func HikeDetailView() -> some View {
        return Image("phone8")
        //尺寸
            .resizable()
            .frame(width: 250, height: 250, alignment: .center)
        //阴影
            .shadow(radius: 10)
            
    }
    
    var body: some View {
        VStack {
            Button(action: {
                isSelected.toggle()
            }) {
                Image(systemName: "star.leadinghalf.fill")
                    .imageScale(Image.Scale.large)
                    .rotationEffect(.degrees(isSelected ? 360/5 : 0))
                    .scaleEffect(isSelected ? 1.5 : 1)
                    .animation(.spring(),value: 1)
                    .padding()
            }
            
            if isSelected {
                HikeDetailView()
                //insertion: 入场动画
                //removal: 出场动画
                    .transition(AnyTransition.asymmetric(insertion: AnyTransition.move(edge: .trailing).combined(with: .opacity), removal: AnyTransition.scale(scale: 0.1).combined(with: .opacity)))
            }
            Spacer()
        }
    }
}

#Preview {
    HikeView()
}
