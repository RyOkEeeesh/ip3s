//
//  EditorViewModel.swift
//  cafesns
//
//  Created by kaji on 2026/06/30.
//

import Foundation
import Combine
final class EditorViewModel: ObservableObject {
    @Published var postText:String = ""
    var canSubmit: Bool {
        !postText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
