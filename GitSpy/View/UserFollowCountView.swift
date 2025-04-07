//
//  UserFollowCountView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-05.
//

import SwiftUI

struct UserFollowCountView: View {
    @State var userNameProfile : String
    @State var titleVal : String
    @Binding var value : Int
    @State var isFromFollowersList : Bool = false
    
    var body: some View {
        VStack{
            Text(titleVal)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
            
            NavigationLink(
                destination: UserFollowListView(username: userNameProfile, type: titleVal.lowercased())
            ) {
                Text(String(value))
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
            .disabled(value == 0 || isFromFollowersList)
        }
        .preferredColorScheme(.dark)
    }
}


#Preview {
    UserFollowCountView(userNameProfile: "Gurpreet0790", titleVal: "Followers", value: .constant(50))
}
