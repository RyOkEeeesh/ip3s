//
//  HomeViewModel.swift
//  cafesns
//
//  Created by kaji on 2026/07/07.
//
import Combine
import Foundation
//投稿
struct Post :Identifiable{
    var id = UUID()
    let text: String
    let shop: String?
}
class HomeViewModel: ObservableObject{
    @Published var posts:[Post] = [
        Post(
            text:"美味しいです",shop: "key Coffee新宿南口店"),
        Post(
            text:"コーヒーが美味でした",shop: nil)
        
    ]
    
}
