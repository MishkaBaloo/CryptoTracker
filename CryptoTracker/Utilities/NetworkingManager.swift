//
//  NetworkingManager.swift
//  CryptoTracker
//
//  Created by Michael on 5/21/24.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLRespone(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLRespone(url: let url): return "[🔥] Bad response from URL: \(url)"
            case .unknown: return "[⚠️] Unkown error occured"
            }
        
        }
    }
    
    static func download(url: URL) ->  AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .default)) // for download on background but now it's automaticly
            .tryMap({ try handleURLResponse(output: $0, url: url)})
            .retry(3)
            .eraseToAnyPublisher()
    }
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
        response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLRespone(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<any Publishers.Decode<AnyPublisher<Data, any Error>, [CoinModel], JSONDecoder>.Failure>) {
        switch completion {
        case .finished:
            break
        case .failure(let error) :
            print(error.localizedDescription)
        }
    }
    
}
