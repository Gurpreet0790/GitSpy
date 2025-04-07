//
//  UserFollowListView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-05.
//

import SwiftUI

struct UserFollowListView: View {
    var vm = UserViewModel()
    
    @State var username : String
    @State var type: String
    
    @State private var followtypeUsers: [UserFollows] = []
    
    var body: some View {
        VStack{
            List {
                ForEach(followtypeUsers){ users in
                    NavigationLink{
                        UserProfileView(username: users.login, isInteractive: false, isSearchEnabled: false)
                    } label : {
                        HStack{
                            
                            //User Image
                            let url = URL(string: users.avatar_url)
                            
                            AsyncImage(url: url){ image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 60)
                            .cornerRadius(15)
                            
                            //User Name
                            Text(users.login)
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.blue, .purple],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        }
                    }
                }
            }
            .padding(.top, 0)
        
        }
        .task {
            // Fetch followers when the view appears
            await vm.getUserFollowsList(for: username, type: type)
            
            await MainActor.run {
                followtypeUsers = vm.userFollowsList
            }
        }
        .navigationTitle("\(type.capitalized) Users")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    UserFollowListView(username: "Gurpreet0790", type: "Followers")
}
