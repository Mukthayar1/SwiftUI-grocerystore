//
//  UIKitExtension.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 18/10/2024.
//

import Foundation

extension String {
    
    var  isValidEmail : Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
}

// Parsing function
func parseResponse(response: NSDictionary) -> (status: String?, token: String?, user: UserModel?) {
    // Extract the status, token, and user dictionary
    let status = response.value(forKey: "status") as? String
    let token = response.value(forKey: "token") as? String
    let userDict = response.value(forKey: "user") as? NSDictionary
    
    // Parse the user dictionary if it exists
    let user = userDict != nil ? UserModel(dict: userDict!) : nil
    
    return (status, token, user)
}

