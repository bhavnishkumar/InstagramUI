//
//  InstagramUIApp.swift
//  InstagramUI
//
//  Created by Admin on 09/08/22.
//

import SwiftUI

@main
struct InstagramUIApp: App {
   
    @available(iOS 14.0, *)
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            SpalshView()
            
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                print("scene become active")
            case .inactive:
                print("scene become inactive")
            case .background:
                print("scene go background")
            default:
                print("")
            }
        }
    }
}
