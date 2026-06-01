//
//  BoxView.swift
//  oxgame
//
//  Created by ip3s on 2026/05/19.
//

import SwiftUI

struct BoxView: View {
	@Binding var isO: Bool?
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
		.background(Color.yellow)
		.cornerRadius(8)
    }
}

#Preview {
    BoxView(
        isO: .constant(true)
    ) {}
}
