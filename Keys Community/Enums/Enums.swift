//
//  Enums.swift
//  Keys Community
//
//  Created by Mac Admin on 06/08/2023.
//

import Foundation

struct Enum {
    enum UserDefaultKeys : String {
        case accessToken
        case refreshToken
        case expirationDate
    }
    
    enum HttpMethod : String {
        case GET
        case POST
    }
    
    enum APIError : Error {
        case failedToGetData
    }
    
    enum PostType : String {
        case event = "event"
        case club = "club"
        case project = "project"
    }
    
    enum FeedOption : String {
        case feed = "feed"
        case updates = "updates"
        
    }
}
