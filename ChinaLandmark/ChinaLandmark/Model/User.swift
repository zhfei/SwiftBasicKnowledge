//
//  User.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/10/4.
//

import Foundation

//Identifiable：遵守了这个协议可以直接作为ForEach的参数进行遍历
struct User: Identifiable {
    var id = UUID()
    
    var username: String
    var prefersNotifications = true
    var prefersSeason = Season.winter
    var birthday = Date()
    //单例模式
    static let `default` = Self(username: "Jack")
    
    //CaseIterable: 遵守了这个协议就可以调用Season.allCases获取所有的枚举类型，返回一个枚举数组
    //Identifiable：枚举也可以遵守这个协议，添加的id属性是一个计算属性，返回rawValue的值
    enum Season: String, CaseIterable, Identifiable {
        var id: String {
            rawValue
        }
        
        case spring = "🌺"
        case summer = "☀️"
        case autumn = "🍂"
        case winter = "⛄️"
    }
}






