//
//  ContentView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-04.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    
    // MARK: - Body
    var body: some View {
        UserProfileView()
            .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
