//
//  main.swift
//  Swift0
//
//  Created by zhoufei on 2022/8/20.
//

import Foundation

var a = 10
var b = 20
var c = a + b;
print(a)
print("Hello, World!-\(c)")

// 操作系统
#if os(macOS) || os(iOS)
// CPU架构
#elseif arch(arm64)
// swift版本
#elseif swift(<5.0) && swift(>=3.0)
// 模拟器
#elseif targetEnvironment(simulator)
// 可导入模块
#elseif canImport(Foundation)
//
#else

#endif


if #available(iOS 10.0, macOS 11.0, *) {
    // iOS 版本从10.0引入
    // macOS 版本从11.0引入
    // * 表示其他所有平台
}







