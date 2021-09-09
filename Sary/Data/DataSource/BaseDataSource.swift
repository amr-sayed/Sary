//
//  BaseDataSource.swift
//  TandaRevamp
//
//  Created by Amr Ahmed on 18/01/2021.
//

import Foundation
import Combine

class BaseDataSource {
    
    
    let baseURL = "https://staging.sary.co/api/v2.5.1/baskets/"
    
    let headers = [
        "" : "ios",
        "App-Version" : "3.1.1.0.0",
        "Accept-Language" : "en",
        "Authorization" : "token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6ODg2NiwidXNlcl9waG9uZSI6Ijk2NjU2NDk4OTI1MCJ9.VYE28vtnMRLmwBISgvvnhOmPuGueW49ogOhXm5ZqsGU"
    ]
    
    public enum ResponseStatus: String {
        case error = "error"
        case sucess = "success"
        case networkError = "networkError"
    }
    
    struct Agent {
        struct Response<T> {
            let value: T
            let response: URLResponse
        }
        func run<T: Decodable>(url : String, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
            var request = URLRequest (url: URL(string: url)!)
            request.setValue("ios", forHTTPHeaderField: "Device-Type")
            request.setValue("3.1.1.0.0", forHTTPHeaderField: "App-Version")
            request.setValue("en", forHTTPHeaderField: "Accept-Language")
            request.setValue("token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6ODg2NiwidXNlcl9waG9uZSI6Ijk2NjU2NDk4OTI1MCJ9.VYE28vtnMRLmwBISgvvnhOmPuGueW49ogOhXm5ZqsGU", forHTTPHeaderField: "Authorization")
            
            return URLSession.shared
                .dataTaskPublisher(for: request) 
                .tryMap { result -> Response<T> in
                    let value = try decoder.decode(T.self, from: result.data) // 4
                    print(result)
                    return Response(value: value, response: result.response) // 5
                }
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    }
}
