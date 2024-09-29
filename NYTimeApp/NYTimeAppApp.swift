//
//  NYTimeAppApp.swift
//  NYTimeApp
//
//  Created by EZAZ AHAMD on 26/09/24.
//

import SwiftUI

@main
struct NYTimeAppApp: App {
    
    
    init() {
        AppTheme.navigationBarColors(background: .accent, titleColor: .white, tintColor: .white)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
