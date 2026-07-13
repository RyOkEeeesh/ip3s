//
//  HomeView.swift
//  cafesns
//
//  Created by kaji on 2026/06/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = HomeViewModel()
    var body: some View {
        ForEach(vm.posts){
            post in Text(post.text)
        }
    }
}

#Preview {
    HomeView()
}
