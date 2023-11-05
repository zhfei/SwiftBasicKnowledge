//
//  CardView.swift
//  FirstApp
//
//  Created by zhoufei on 2023/11/4.
//

import SwiftUI

struct CardView: View {
    // MARK: Properties
//    var gradient: [Color] = [Color("Color01"),Color("Color02")]
    var cardData: Card
    
    
    // MARK: Body
    var body: some View {
        ZStack{
            Image(cardData.imageName, bundle: nil)
            
            VStack(content: {
                Text(cardData.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text(cardData.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic() //斜体
            })
            .offset(y: -218)
            
            Button {
                print("按钮点击")
                playSound(sound: "sound-transitions", type: "mp3")
            } label: {
                HStack {
                    Text(cardData.callToAction)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .accentColor(.blue) // 设置强调色
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                }
                .padding(.horizontal,24)
                .padding(.vertical)
                .background(LinearGradient(colors: cardData.gradientColors, startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }
            .offset(y:210)

        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(colors: cardData.gradientColors, startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

// MARK: Preview
#Preview {
    CardView(cardData: cardData[2])
        .previewLayout(.sizeThatFits) //展示组件尺寸
//        .previewDevice("iPhone 11") //展示设备尺寸
}
