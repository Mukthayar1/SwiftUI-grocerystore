//
//  UIKitExtension.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 18/10/2024.
//

import Foundation
import SwiftUI

extension String {
    var  isValidEmail : Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
    func stringDateToDate(format : String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    func stringDateChangeFormat(format:String,newFormat:String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        if let dt = formatter.date(from: self){
            formatter.dateFormat = format
            return formatter.string(from: dt)
        }else{
            return ""
        }
    }
}


extension Date {
    func displayDate(format: String , addMinTime: Int = 0 ) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let date = self.addingTimeInterval(TimeInterval(60*addMinTime))
        return formatter.string(from: date)
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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

