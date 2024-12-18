//
//  Globs.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 16/10/2024.
//

import Foundation

struct Globs {
    
    static let AppName = "Grocery Store";
    static let Base_URL = "http://localhost:3001/api/app/";
    static let LOGIN_ENDPOINT = "/api/UserAcc"
    static let SIGNUP_ENDPOINT = "/api/v2/UserAcc"
    
    static let userPayload = "user_payload"
    static let userLogin = "user_login"
    
    static let homeData = "\(Base_URL)home"
    
    static let productDetail = "\(Base_URL)product_detail"
    
    static let favoriteList = "\(Base_URL)favorite_list"
    static let addRemoveFavorite = "\(Base_URL)add_remove_favorite"
    
    static let exporeList = "\(Base_URL)explore_category_list"
    static let exporeListItem = "\(Base_URL)explore_category_items_list"
    
    static let addressListItem = "\(Base_URL)delivery_address"
    static let addAddress = "\(Base_URL)add_delivery_address"
    static let updateAddress = "\(Base_URL)update_delivery_address"
    static let deleteAddress = "\(Base_URL)delete_delivery_address"

    




}

struct KKey {
    static let status = "status"
    static let message = "message"
    static let payload = "payload"
}

class Utils {
    class func UDSET(data: Any, key: String) {
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    class func UDValue(key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    class func UDValuBool(key: String) -> Bool? {
        return UserDefaults.standard.value(forKey: key) as? Bool ?? false
    }
    class func UDValuBoolTrue(key: String) -> Bool? {
        return UserDefaults.standard.value(forKey: key) as? Bool ?? true
    }
    class func UDRemove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
