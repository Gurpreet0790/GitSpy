//
//  UserProfileView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-04.
//

import SwiftUI

struct UserProfileView: View {
    
    // MARK: - Properties
    var username: String? = nil
    var isInteractive: Bool = true
    var isSearchEnabled: Bool = true

    @State private var searchText: String = ""
    @State private var debounceTimer: Timer?
    @EnvironmentObject var viewModel : UserViewModel
    @State private var hasAppeared = false
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                if isSearchEnabled{
                    SearchBarView()
                }
                ProfileStateView()
                Spacer()
            }
            .navigationTitle(Constants.navTitle)
        }
        .disabled(!isSearchEnabled)
        .themeViewStyle()
        .onAppear {
            if let username, !isSearchEnabled {
                viewModel.fetchUser(for: username)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    //UserProfileView()
}
