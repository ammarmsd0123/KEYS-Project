//
//  APIManager.swift
//  Keys Community
//
//  Created by Mac Admin on 14/08/2023.
//

import Foundation

final class APIManager {
    
    // MARK: Singleton
    static var shared = APIManager()
    private init(){}
    
    func makeAPICall<T: Codable>(endpoint: String,
                                 httpMethod: Enum.HTTPMethod,
                                 decodingModel: T.Type,
                                 headers: [String: String]? = nil,
                                 queryParams: [String: String]? = nil,
                                 bodyParams: [String: Any]? = nil,
                                 completion: @escaping (Result<T,Error>) -> Void) {
        
        
        guard let apiURL = URL(string: endpoint) else {return}
        var components = URLComponents(string: apiURL.absoluteString)
        
        // Add query items if provided
        if let queryParams = queryParams {
            components?.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = components?.url else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        // Create the URL request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"//httpMethod.rawValue
        
        // Add headers if provided
        headers?.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        // Add body data if provided
        if let bodyParams = bodyParams {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: bodyParams, options: [])
                request.httpBody = jsonData
                print("bodyParams", jsonData)
            } catch {
                completion(.failure(error))
                return
            }
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print("URLRequestBody", request.httpBody)
//        print("bodyParams", )
        // Perform the network request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            print("data", data, "response", response)
            
            guard let data = data, error == nil else {
                completion(.failure(Enum.APIError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(decodingModel, from: data)
                print(result)
                completion(.success(result))
            }
            catch {
                print("error in JSON Decoding", error)
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
