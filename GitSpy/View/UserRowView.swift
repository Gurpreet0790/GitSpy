//
//  UserRowView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-06.
//

import SwiftUI

// MARK: - UserRowView
struct UserRowView: View {
    
    // MARK: - Properties
    let user: UserFollows
    
    // MARK: - Body
    var body: some View {
        HStack {
            UserAvatarView(imageURL: user.avatar_url, width: 60, height: 60)
                .accessibilityHidden(true)
            
            Text(user.login)
                .userNameListViewStyle()
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Preview
#Preview {
    UserRowView(user: .mock)
}

extension UserFollows {
    static let mock = UserFollows(
        id: Constants.mockUserId, login: Constants.mockUserName,
        avatar_url: Constants.mockUserImage
    )
}
