	//
	//  EditorView.swift
	//  cafesns
	//
	//  Created by Kazunari Hirosawa on 2026/06/30.
	//

import SwiftUI

struct EditorView: View {
	@State private var postText = ""
	
	private var canSubmit: Bool {
		!postText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
	}
	
	var body: some View {
		NavigationStack {
			Form {
				Section("投稿内容") {
					ZStack(alignment: .topLeading) {
						if postText.isEmpty {
							Text("例: このカフェは静かで勉強しやすかった。ラテもおいしい。")
								.foregroundStyle(.secondary)
								.padding(.top, 8)
								.padding(.leading, 5)
						}
						
						TextEditor(text: $postText)
							.frame(minHeight: 160)
							.scrollContentBackground(.hidden)
					}
				}
				
				
				
				
			}
			.navigationTitle("投稿")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button("投稿") {
					}
					.disabled(!canSubmit)
				}
			}
		}
	}
}


#Preview {
	EditorView()
}
