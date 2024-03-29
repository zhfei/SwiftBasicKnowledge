//
//  HikeView.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/9/25.
//

import SwiftUI

struct CapsuleView: View {
    var body: some View {
        return Capsule()
            .fill(.red)
            .frame(width: 24,height: 60, alignment: .bottom)
            .animation(Animation.spring().speed(2).delay(0.03), value: 1)
    }
}

struct HikeDetailView: View {
    var body: some View {
        return Image("phone8")
        //尺寸
            .resizable()
            .frame(width: 250, height: 250, alignment: .center)
        //阴影
            .shadow(radius: 10)
    }
    
}

struct HikeView: View {
    @State private var isSelected = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation{
                    isSelected.toggle()
                }
                
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
                    .transition(AnyTransition.asymmetric(insertion: AnyTransition.opacity.animation(.easeIn), removal: AnyTransition.scale(scale: 0.1).animation(.easeInOut(duration: 1.0))))
                
                CapsuleView()
            }
            
            Spacer()
        }
    }
}

#Preview {
    HikeView()
}
