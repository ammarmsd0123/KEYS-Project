//
//  CreateUserModel.swift
//  Keys Community
//
//  Created by Mac Admin on 14/08/2023.
//

import Foundation

struct CreateUser : Codable {
    let user : User?
    let token : String?
    let statusCode : Int?
    let message : String?
    

    enum CodingKeys: String, CodingKey {

        case user = "user"
        case token = "token"
        case statusCode = "statusCode"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}


    
    struct User : Codable {
        let first_name : String?
        let last_name : String?
        let mobile_number : String?
        let email : String?
        let verification_status : String?
        let deleted_at : String?
        let created_at : String?
        let updated_at : String?
        let id : Int?

        enum CodingKeys: String, CodingKey {

            case first_name = "first_name"
            case last_name = "last_name"
            case mobile_number = "mobile_number"
            case email = "email"
            case verification_status = "verification_status"
            case deleted_at = "deleted_at"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case id = "id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
            last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
            mobile_number = try values.decodeIfPresent(String.self, forKey: .mobile_number)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            verification_status = try values.decodeIfPresent(String.self, forKey: .verification_status)
            deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
        }

    }


