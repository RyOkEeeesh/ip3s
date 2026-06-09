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

typealias Winner = (Bool, [Int])?

struct ContentView: View {
    @State var boxes: [Bool?] = [
        nil, nil, nil,
        nil, nil, nil,
        nil, nil, nil
    ]
    @State var winner: Winner = nil
    @State var isO: Bool = true
    
    func getWinner() -> Winner {
        for pattern in winPattern {
            if let a = boxes[pattern[0]],
               a == boxes[pattern[1]],
               a == boxes[pattern[2]] {
                return (a, pattern)
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
        withAnimation(.easeInOut(duration: 0.15)) {
            winner = getWinner()
        }
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
                .font(.largeTitle)
            Spacer()
            HStack {
                let isDraw = !boxes.contains(nil)
                Text(winner == nil
                     ? isDraw
                     ? "Draw"
                     : "Player: "
                     :"Winner: "
                ).font(.title)
                if (!isDraw || winner != nil) {
                    Image(systemName: winner?.0 ?? isO ? "circle" : "xmark")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            VStack {
                ForEach(0..<3) { i in
                    HStack {
                        ForEach(0..<3) { j in
                            let idx = i * 3 + j
                            BoxView(
                                isO: boxes[idx],
                                isWinLine: winner?.1.contains(idx) ?? false
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
                    .font(.title3)
            }
            .buttonStyle(BorderedButtonStyle())
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
