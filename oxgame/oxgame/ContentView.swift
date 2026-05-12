//
//  ContentView.swift
//  oxgame
//
//  Created by ip3s on 2026/04/28.
//

import SwiftUI

typealias Player = Bool?
let x: Player = true
let o: Player = false
let empty: Player = nil

struct ContentView: View {
    var body: some View {
		VStack {
			Text("OXGame")
			VStack {
				ForEach(0..<3) {i in
					HStack {
						ForEach(0..<3) {i in
							Button("O") {
								
							}
							.frame(width: 100, height: 100)
						}
					}
				}
			}
		}
		
    }
}

#Preview {
    ContentView()
}
