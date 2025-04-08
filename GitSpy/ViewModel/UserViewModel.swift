//
//  UserViewModel.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-05.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    // MARK: - Enum API Status
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    // MARK: - Published Properties
    @Published var searchText: String = ""
    @Published var isFetching: FetchStatus = .notStarted
    @Published var userDetails: User?
    @Published var userFollowsList: [UserFollows] = []
    
    // MARK: - Private Properties
    private var cancellables = Set<AnyCancellable>()
    private let fetcher: FetchingService
    
    // MARK: - Initializer
    init(fetcher: FetchingService = FetchService()) {
        self.fetcher = fetcher
        bindSearch() // Starts binding search text changes
    }
    
    // MARK: - Fetch Method
    private func fetch<T>(
        _ publisher: AnyPublisher<T, Error>,
        onSuccess: @escaping (T) -> Void
    ) {
        isFetching = .fetching
        
        publisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isFetching = .success
                case .failure(let error):
                    self?.isFetching = .failed(error: error)
                }
            } receiveValue: { value in
                onSuccess(value)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Fetch User Profile
    func fetchUser(for searchTxt: String) {
        let endpoint = searchTxt
        fetch(
            fetcher.fetch(endpoint),
            onSuccess: { [weak self] user in
                self?.userDetails = user
            }
        )
    }
    
    // MARK: - Fetch User Followers/Following
    @MainActor
    func fetchUserFollowsList(for username: String, type: String) {
        
        let endpoint = "\(username)/\(type)"
        fetch(fetcher.fetch(endpoint), onSuccess: { [weak self] (users: [UserFollows]) in
            self?.userFollowsList = users
        })
    }
    
    // MARK: - Search Function
    private func bindSearch() {
        $searchText
            .removeDuplicates()
            .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
            .sink { [weak self] text in
                guard let self = self, !text.isEmpty else { return }
                self.fetchUser(for: text)
            }
            .store(in: &cancellables)
    }
}
