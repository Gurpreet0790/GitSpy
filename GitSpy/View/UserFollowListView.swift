//
//  UserFollowListView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-05.
//

import SwiftUI

struct UserFollowListView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: UserViewModel
    
    let username: String
    let type: String
    
    @State private var followTypeUsers: [UserFollows] = []
    
    // MARK: - Body
    var body: some View {
        VStack {
            List {
                ForEach(followTypeUsers) { user in
                    NavigationLink {
                        UserProfileView(
                            username: user.login,
                            isInteractive: false,
                            isSearchEnabled: false
                        )
                    } label: {
                        UserRowView(user: user)
                    }
                }
            }
            .padding(.top, 0)
        }
        .task {
            viewModel.fetchUserFollowsList(for: username, type: type)
        }
        .onReceive(viewModel.$userFollowsList) { updatedList in
            self.followTypeUsers = updatedList
        }
        .navigationTitle("\(type.capitalized) Users")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
#Preview {
    let previewVM = UserViewModel()
    return UserFollowListView(username: "Gurpreet0790", type: "followers")
}
