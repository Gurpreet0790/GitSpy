//
//  UserFollowCountView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-05.
//

import SwiftUI

struct UserFollowCountView: View {
    
    // MARK: - Properties
    let user: User
    let titleVal: String
    let isFromFollowersList: Bool
    

    // MARK: - Computed Properties
    private var value: Int {
        titleVal == Constants.followersTitle ? user.followers : user.following
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text(titleVal)
                .textStyle(fontSize: .title3, fontWeight: .bold, textColor: .gray)
            
            NavigationLink(
                destination: UserFollowListView(username: user.login, type: titleVal.lowercased())
            ) {
                Text("\(value)")
                    .textStyle(fontSize: .title3, fontWeight: .bold, textColor: .white)
            }
            .disabled(value == 0 || isFromFollowersList)
        }
        .themeViewStyle()
    }
}


// MARK: - Preview
#Preview {
//    UserFollowCountView(username: "Gurpreet0790", titleVal: "Followers", value: .constant(50))
}
