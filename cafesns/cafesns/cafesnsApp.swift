//
//  cafesnsApp.swift
//  cafesns
//
//  Created by kaji on 2026/06/23.
//

import SwiftUI

@main
struct cafesnsApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	
	var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
