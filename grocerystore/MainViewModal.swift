//
//  MainViewModal.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 16/10/2024.
//

import SwiftUI

class MainViewModal : ObservableObject  {
    
    static var shared: MainViewModal = MainViewModal();
    
    @Published var txtUserName : String = ""
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var txtPhoneNumber : String = "+923434584676"
    
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var isUserLoggedIn: Bool = true
    @Published var userObject: UserModel = UserModel(dict: [:])
    
    init() {
        if((Utils.UDValuBool(key: Globs.userLogin)) != nil){
            setUserData(uDict: Utils.UDValue(key: Globs.userPayload) as? NSDictionary ?? [:])
        }
#if DEBUG
        txtUserName = "Mukthayar1"
        txtEmail = "bystro@gmail.com"
        txtPassword = "Test123@"
#endif
    }
    
    //MARK : SERVICE-CALL
    
    func serviceCallLogim() {
        
        if(txtEmail.isEmpty){
            self.showError = true
            self.errorMessage = "Email is required"
            return
        }
        
        if(!txtEmail.isValidEmail){
            self.showError = true
            self.errorMessage = "Please enter valid email address"
            return
        }
        
        if(txtPassword.isEmpty){
            self.showError = true
            self.errorMessage = "Password is required"
            return
        }
        
        ServiceCall.post(parameter: ["username" : txtEmail , "password" : txtPassword], path: "\(Globs.Base_URL)\(Globs.LOGIN_ENDPOINT)?fcmToken=token") { responseObj in
            if let response = responseObj as? NSDictionary {
                
                if (response.value(forKey: "status") as? String ?? "") == "Success" {
                    self.txtEmail = "";
                    self.txtPassword = "";
                    self.showError = false;
                    self.errorMessage = "";
                    
                    var payload = response
                    let parsedResponse = parseResponse(response: payload)
                    if let user = parsedResponse.user {
                        if let userData = try? JSONEncoder().encode(user),
                           let userDict = try? JSONSerialization.jsonObject(with: userData, options: .mutableContainers) as? NSDictionary {
                            self.setUserData(uDict: userDict)
                        }
                    }

                    print(response)
                }else{
                    self.showError = true
                    self.errorMessage = "Invalid email or password"
                }
            }
        } failure: { error in
            self.showError = true
            self.errorMessage = error!.localizedDescription
        }
    }
    
    func serviceCallSignup() {
        
        if(txtUserName.isEmpty){
            self.showError = true
            self.errorMessage = "User name is required"
            return
        }
        
        if(txtEmail.isEmpty){
            self.showError = true
            self.errorMessage = "Email is required"
            return
        }
        
        if(!txtEmail.isValidEmail){
            self.showError = true
            self.errorMessage = "Please enter valid email address"
            return
        }
        
        if(txtPassword.isEmpty){
            self.showError = true
            self.errorMessage = "Password is required"
            return
        }
        
        var params = ["Username":txtUserName,"password":txtPassword,"Email":txtEmail,"ContactNum":txtPhoneNumber,"ProfileImageURL":"","LoginStatus":"1"]
        
        ServiceCall.post(parameter: params as NSDictionary, path: "\(Globs.Base_URL)\(Globs.SIGNUP_ENDPOINT)?fcmToken=token") { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: "status") as? String ?? "" == "success" {
                    print("resppppp===============\n>\(response)")
                }else{
                    DispatchQueue.main.async {
                        print("1=====1====>")
                        self.showError = true
                        self.errorMessage = "Invalid email or password"
                    }
                }
            }
        } failure: { error in
            DispatchQueue.main.async {
                print("2=====2====>")
                self.showError = true
                self.errorMessage = error!.localizedDescription
            }
        }
    }
    
    func setUserData(uDict:NSDictionary){
        Utils.UDSET(data: uDict, key: Globs.userPayload)
        Utils.UDSET(data: true, key: Globs.userLogin)
        print("=========3>\(uDict)")
        self.userObject = UserModel(dict: uDict as NSDictionary)
        self.isUserLoggedIn = true
    }
}
