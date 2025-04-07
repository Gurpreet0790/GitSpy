//
//  UserProfileView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-04.
//

import SwiftUI

struct UserProfileView: View {
    var username: String? = nil
    var isInteractive: Bool = true
    var isSearchEnabled: Bool = true
    
    
    @State private var followers = 0
    @State private var following = 0
    @State private var searchText: String = ""
    @State private var debounceTimer: Timer?
    @State var vm = UserViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                switch vm.status {
                case .notStarted:
                    Spacer()
                case .fetching:
                    ProgressView()
                        .padding()
                case .success:
                    if let user = vm.userDetails {
                        profileContent(for: user)
                    }
                case .failed:
                    NoUserAvailableView()
                }
                
                Spacer()
            }
            .navigationTitle("Git Spy")
        }
        //Search Bar
        .searchable(text: $searchText, prompt: "Search GitHub username")
        .disabled(!isSearchEnabled)
        .preferredColorScheme(.dark)
        .onAppear {
            if let username, !isSearchEnabled {
                Task { await loadUser(username: username) }
            }
        }
        .onChange(of: searchText) {
            guard isSearchEnabled else { return }
            
            debounceTimer?.invalidate()
            debounceTimer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { _ in
                Task { await loadUser(username: searchText) }
            }
        }
    }
    
    @ViewBuilder
    //MARK: - User Profile
    private func profileContent(for user: User) -> some View
    {
        HStack {
            //User Image
            if let url = URL(string: user.avatar_url) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                .cornerRadius(15)
            }
            Spacer()
            
            //FollowersUsers Count
            UserFollowCountView(userNameProfile: user.login, titleVal: "Followers", value: $followers, isFromFollowersList: !isInteractive)
                .frame(maxWidth: .infinity)
            
            //FollowingUsers Count
            UserFollowCountView(userNameProfile: user.login, titleVal: "Following", value: $following, isFromFollowersList: !isInteractive)
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
        
        VStack(alignment: .leading, spacing: 5) {
            //UserName
            Text(user.name.isEmpty ? user.login : user.name)
                .font(.title3)
                .fontWeight(.bold)
            
            //User Description
            Text(user.bio)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(.white)
        .padding(15)
        
        Spacer()
    }
    //MARK: - Get User Data
    private func loadUser(username: String) async {
        await vm.getUserData(for: username)
        
        if let f = vm.userDetails?.followers {
            await MainActor.run { self.followers = f }
        }
        
        if let f = vm.userDetails?.following {
            await MainActor.run { self.following = f }
        }
    }
}

#Preview { UserProfileView() }
