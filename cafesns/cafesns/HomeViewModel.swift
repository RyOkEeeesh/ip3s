//
//  HomeViewModel.swift
//  cafesns
//
//  Created by kaji on 2026/07/07.
//
import Combine
import Foundation
import FirebaseFirestore
//投稿
struct Post :Identifiable{
    var id = UUID()
    let text: String
    let shop: String?
}
class HomeViewModel: ObservableObject{
	let db = Firestore.firestore()
    @Published var posts:[Post] = [
        Post(
            text:"美味しいです",shop: "key Coffee新宿南口店"),
        Post(
            text:"コーヒーが美味でした",shop: nil)
        
    ]
    
	func startEventLisner() {
		db.collection("posts")
			.addSnapshotListener { QuerySnapshot?, (any Error)? in
				if let err = Error {
					
				}
				
				if let querySnapshot = QuerySnapshot {
					querySnapshot.documentChanges.forEach { change in
						switch change.type {
							case .added:
							case .modified:
							case .removed:
						}
					}
				}
				
				
			}
	}
}
