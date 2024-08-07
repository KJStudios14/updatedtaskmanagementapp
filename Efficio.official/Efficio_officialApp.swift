//
//  Efficio_officialApp.swift
//  Efficio.official
//
//  Created by KJemide on 07/08/2024.
//

import FirebaseCore
import SwiftUI

@main
struct Efficio_officialApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
