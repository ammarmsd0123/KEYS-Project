//
//  UserDetailsVM.swift
//  Keys Community
//
//  Created by Mac Admin on 14/08/2023.
//

import Foundation

class UserDetailsVM {
    
    func createUser(firstName: String, lastName: String, mobileNumber: String,password: String, type: String, email: String? = nil) {
        
        let bodyParams = ["email": email,
                          "mobile_number": mobileNumber,
                          "password": password,
                          "first_name": firstName,
                          "last_name": lastName,
                          "type": type,
        
        ]
        
        APIManager.shared.makeAPICall(endpoint: EndPoints.createUser, httpMethod: .post, decodingModel: CreateUser.self,bodyParams: bodyParams) {[weak self] apiResult in
            switch apiResult {
                case .success(let model):
                    print(model)
                case .failure(let error):
                    print(error.localizedDescription)
                    
            }
            
        }
    }

}
