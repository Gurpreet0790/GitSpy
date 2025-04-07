//
//  User.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-05.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let bio: String
    let followers: Int
    let following: Int
    let avatar_url: String
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.login = try container.decode(String.self, forKey: .login)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.bio = try container.decodeIfPresent(String.self, forKey: .bio) ?? ""
        self.followers = try container.decodeIfPresent(Int.self, forKey: .followers) ?? 0
        self.following = try container.decodeIfPresent(Int.self, forKey: .following) ?? 0
        self.avatar_url = try container.decodeIfPresent(String.self, forKey: .avatar_url) ?? ""
    }
}

