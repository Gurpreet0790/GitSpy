//
//  Constants.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-06.
//

import Foundation

struct Constants{
    static let baseUrl = URL(string: "https://api.github.com/users/")!
    static let navTitle = "GitSpy"
    static let searchPlaceholder = "Search GitHub username"
    static let followersTitle = "Followers"
    static let followingTitle = "Following"
    static let noUserAvailable = "No GitHub User"
    static let errorMessage = "Please try a different username"
    static let mockUserId = 1
    static let mockUserName = "octocat"
    static let mockUserImage = "https://github.githubassets.com/images/modules/logos_page/Octocat.png"
    static let loading = "Loading..."
    
    //Images
    static let noUserAvailableImage = "person.crop.circle.badge.exclamationmark"
    static let searchImage = "magnifyingglass"
    static let cancelImage = "xmark.circle.fill"
    
    //Button
    static let cancelBtn = "Cancel"
    
}
