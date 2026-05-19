//
//  BoxView.swift
//  oxgame
//
//  Created by ip3s on 2026/05/19.
//

import SwiftUI

struct BoxView: View {
	@State var isX: Bool? = nil;
    var body: some View {
		Button {
			isX = true
		} label: {
			Group {
				if let isX = isX {
					Image(systemName: isX ? "xmark" : "circle")
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
    BoxView()
}
