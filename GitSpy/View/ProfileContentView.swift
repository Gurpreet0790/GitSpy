//
//  ProfileContentView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-07.
//

import SwiftUI

struct ProfileContentView: View {
    
    // MARK: - Properties
    let user: User
    let isInteractive: Bool
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 20) {
                // Avatar Image
                UserAvatarView(imageURL: user.avatar_url, width: 100, height: 100)
                
                // Follower & Following Count Views
                UserFollowCountView(user: user,
                                        titleVal: Constants.followersTitle,
                                        isFromFollowersList: !isInteractive)
                    .userFollowsCountViewStyle()
                    
                UserFollowCountView(user: user,
                                        titleVal: Constants.followingTitle,
                                        isFromFollowersList: !isInteractive)
                    .userFollowsCountViewStyle()
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 20) {
                // Name
                Text(user.name.isEmpty ? user.login : user.name)
                    .textStyle(fontSize: .title3, fontWeight: .bold, textColor: .white)
                
                // Bio
                if !user.bio.isEmpty {
                    Text(user.bio)
                        .textStyle(fontSize: .subheadline, fontWeight: .regular, textColor: .white)
                        .padding(.top, 5)
                }
            }
            .padding(.top, 20)
        }
        .padding(.vertical)
    }
}

// MARK: - Preview
#Preview {
   // ProfileContentView(user: user, isInteractive: false)
}
