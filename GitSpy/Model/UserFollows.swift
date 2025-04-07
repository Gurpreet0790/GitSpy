//
//  UserFollows.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-05.
//

import Foundation

struct UserFollows: Codable, Identifiable {
    let id: Int
    let login: String
    let avatar_url : String
}
