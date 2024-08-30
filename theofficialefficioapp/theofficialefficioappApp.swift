//
//  theofficialefficioappApp.swift
//  theofficialefficioapp
//
//  Created by KJemide on 10/08/2024.
//
import FirebaseCore
import SwiftUI

@main
struct theofficialefficioappApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            PreferredNameView()
                .environment(\.font, Font.custom("Mitr", size: UIFont.preferredFont(forTextStyle: .body).pointSize))
                                .modifier(GlobalFontModifier())
        }
    }
}
