//
//  RealFrensIOSApp.swift
//  RealFrensIOS
//
//  Created by Purin Spitzer on 11/15/23.
//
import SwiftUI
import FirebaseCore

@main
struct RealFrensIOSApp: App {
    // Register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
