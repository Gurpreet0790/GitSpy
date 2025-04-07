//
//  UserViewModel.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-05.
//

import Foundation

@Observable
@MainActor
class UserViewModel {
    
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var userDetails: User?
    var userFollowsList: [UserFollows] = []
    
    
    func getUserData(for searchTxt:String) async {
        status = .fetching
        
        do{
            userDetails = try await fetcher.fetchUserDetails(from: searchTxt)
                        
            status = .success
        } catch {
            status = .failed(error: error)
        }
    }
    
    func getUserFollowsList(for username: String, type: String) async {
        status = .fetching
        
        do{
            userFollowsList = try await fetcher.fetchUserFollowList(for: username, type: type)
                        
            status = .success
        } catch {
            status = .failed(error: error)
        }
    }
}
