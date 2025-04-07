//
//  FetchService.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-05.
//

import Foundation

struct FetchService {
    enum FetchError: Error {
        case badResponse
    }
    
    let baseURL = URL(string: "https://api.github.com/users/")!
    
    //MARK: Fetch User
    func fetchUserDetails(from searchTxt: String) async throws -> User
    {
        //Build Fetch URL
        let userURL = baseURL.appending(path: searchTxt)
            
        //Fetch Data
        let (data, response) = try await URLSession.shared.data(from: userURL)
        
        print("data and response \(data) amd \(response)")
        //Handle Reponse
        guard let response = response as? HTTPURLResponse, response.statusCode
                == 200 else {
            throw FetchError.badResponse
        }
        
        //Decode Data
        let user = try JSONDecoder().decode(User.self, from: data)
        
        //Return User
        return user
    }
    
    //MARK: Fetch User Followers/Following Users List
    func fetchUserFollowList(for username: String, type: String) async throws -> [UserFollows]
    {
        //Build Fetch URL
        let userURL = baseURL.appending(path: "\(username)/\(type)")
        
        //Fetch Data
        let (data, response) = try await URLSession.shared.data(from: userURL)
        
        //Handle Reponse
        guard let response = response as? HTTPURLResponse, response.statusCode
                == 200 else {
            throw FetchError.badResponse
        }
        
        //Decode Data
        let userFollowList = try JSONDecoder().decode([UserFollows].self, from: data)
        
        //Return Users List
        return userFollowList
    }
}

