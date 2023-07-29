//
//  NSObject.swift
//  Keys Community
//
//  Created by Ammar Masood on 28/07/2023.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
