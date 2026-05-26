//
//  ContentView.swift
//  oxgame
//
//  Created by ip3s on 2026/04/28.
//

import SwiftUI

let winPattern: [[Int]] = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[2, 4, 6]
]

struct ContentView: View {
    var body: some View {
		@State var boxes: [Bool?] = [
			nil, nil, nil,
			nil, nil, nil,
			nil, nil, nil
		]
		
		func getWinner() -> Bool? {
			for i in 0..<winPattern.count {
				if (boxes[winPattern[i][0]] && boxes[winPattern[i][0]] == boxes[winPattern[i][1]] && boxes[winPattern[i][0]] == boxes[winPattern[i][2]]) {
					return boxes[winPattern[i][0]]
				}
				return nil
			}
		}
		
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
