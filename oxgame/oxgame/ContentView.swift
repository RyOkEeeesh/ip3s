//
//  ContentView.swift
//  oxgame
//
//  Created by ip3s on 2026/04/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		VStack {
			Text("OXGame")
			VStack {
				ForEach(0..<3) {i in
					HStack {
						ForEach(0..<3) {j in BoxView()}
					}
				}
			}
		}
		
    }
}

#Preview {
    ContentView()
}
