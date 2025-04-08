//
//  FetchService.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-05.
//

import Foundation
import Combine

// MARK: - Fetching Service Protocol
protocol FetchingService {
    func fetch<T: Decodable>(_ endpoint: String) -> AnyPublisher<T, Error>
}

// MARK: - Fetch Service Implementation
struct FetchService: FetchingService {
    
    // MARK: - Fetch Errors
    enum FetchError: Error {
        case badResponse
        case decodingError
        case networkError(URLError)
    }
    
    //MARK: Fetch User
    func fetch<T: Decodable>(_ endpoint: String) -> AnyPublisher<T, Error> {
        
        //API URL
        let url = Constants.baseUrl.appendingPathComponent(endpoint)

        //Fetch Data
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap{ output -> Data in
                
                //Handle Response
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200  else{
                    throw FetchError.badResponse
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let urlError = error as? URLError {
                    return FetchError.networkError(urlError)
                } else if error is DecodingError {
                    return FetchError.decodingError
                }
                return error
            }
            .eraseToAnyPublisher()
    }
}

