//
//  ThisInBeijingApp.swift
//  ThisInBeijing
//
//  Created by zhoufei on 2023/11/7.
//

import SwiftUI

@main
struct ThisInBeijingApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newValue in
            switch newValue {
            case .active:
                print("active")
            case .background:
                print("background")
            case .inactive:
                print("inactive")
            @unknown default:
                print("default")
            }
        }
    }
}
