//
//  Globs.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 16/10/2024.
//

import Foundation

struct Globs {
    
    static let AppName = "Grocery Store";
    static let Base_URL = "https://foodostibackend0324324324.azurewebsites.net";
    static let LOGIN_ENDPOINT = "/api/UserAcc"
    static let SIGNUP_ENDPOINT = "/api/v2/UserAcc"
    
    static let userPayload = "user_payload"
    static let userLogin = "user_login"


   
//    GOOGLE_API=AIzaSyCAcgEQMvho7rnMg-cV7wLEZjJLoH50ehk
//    HOME_CHEF_VERIFICATION =https://homechef-verification-dev.foodosti.com/
//    APP_VERSION="A-12"
//    APP_CHECK_VERSION_ANDROID = "1.2"
//    APP_CHECK_VERSION_IOS = "1.2"
//    EncryptionKey=4567F00D0STI1234
//    SAS_TOKEN="?sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2025-09-22T20:42:34Z&st=2023-09-15T12:42:34Z&spr=https&sig=npX1TV1ZbowbbHYuYRwIohKN3kyLKjkCMwOusx2v%2FPo%3D"
//    Environment="DEV"
//    FDSocketUrl=http://18.188.212.234
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
