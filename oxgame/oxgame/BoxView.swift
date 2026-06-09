//
//  BoxView.swift
//  oxgame
//
//  Created by ip3s on 2026/05/19.
//

import SwiftUI

struct BoxView: View {
    let isO: Bool?
    let isWinLine: Bool

    let onClick: () -> Void
    var body: some View {
		Button {
            onClick()
		} label: {
			Group {
				if let isO = isO {
					Image(systemName: isO ? "circle" : "xmark")
						.resizable()
						.aspectRatio( contentMode: .fit)
						.padding(30)
				} else {
					Spacer()
						.frame(width: 100, height: 100)
				}
			}
		}
		.frame(width: 100, height: 100)
        .background(isWinLine ? Color.yellow : Color.clear)
		.cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 4)
        )
    }
}

#Preview {
    BoxView(
        isO: true,
        isWinLine: false,
    ) {}
}
