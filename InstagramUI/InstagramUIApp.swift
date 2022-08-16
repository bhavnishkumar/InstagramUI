//
//  InstagramUIApp.swift
//  InstagramUI
//
//  Created by Admin on 09/08/22.
//

import SwiftUI

@main
struct InstagramUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ProfileView()
                
        }
    }
}
