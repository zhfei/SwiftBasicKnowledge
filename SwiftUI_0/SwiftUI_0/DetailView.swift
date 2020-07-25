//
//  DetailView.swift
//  SwiftUI_0
//
//  Created by 周飞 on 2020/7/25.
//  Copyright © 2020 zhf. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @State var zoomed = false
    
    var body: some View {
        Image("pic3")
            .resizable()
            .aspectRatio(contentMode: zoomed ? .fill : .fit)
            .onTapGesture {
                withAnimation {
                    //点击操作
                    self.zoomed.toggle()
                }
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
