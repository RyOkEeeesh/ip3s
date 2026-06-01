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
    @State var boxes: [Bool?] = [
        nil, nil, nil,
        nil, nil, nil,
        nil, nil, nil
    ]
    @State var winner: Bool? = nil
    @State var isO: Bool = true
    
    func getWinner() -> Bool? {
        for pattern in winPattern {
            let a = boxes[pattern[0]]
            let b = boxes[pattern[1]]
            let c = boxes[pattern[2]]

            if a != nil && a == b && a == c {
                return a
            }
        }
        return nil
    }
    
    func handleBtnClick(i: Int) {
        if winner != nil || boxes[i] != nil {
            return
        }
        boxes[i] = isO
        isO.toggle()
        winner = getWinner()
    }
    
    func reset() {
        boxes = [
            nil, nil, nil,
            nil, nil, nil,
            nil, nil, nil
        ]
        winner = nil
        isO = true
    }
    
    var body: some View {
        VStack(spacing: 36) {
            Text("OXGame")
            HStack {
                let isDraw = !boxes.contains(nil)
                Text(winner == nil
                     ? isDraw
                        ? "Draw"
                        : "Player: "
                     :"Winner: "
                )
                if (!isDraw) {
                    Image(systemName: winner ?? isO ? "circle" : "xmark")
                }
            }
            VStack {
                ForEach(0..<3) { i in
                    HStack {
                        ForEach(0..<3) { j in
                            let idx = i * 3 + j
                            BoxView(
                                isO: $boxes[idx]
                            ) {
                                handleBtnClick(i: idx)
                            }
                        }
                    }
                }
            }
            Button {
                reset()
            } label: {
                Text("Reset")
            }
        }
    }
}

#Preview {
    ContentView()
}
