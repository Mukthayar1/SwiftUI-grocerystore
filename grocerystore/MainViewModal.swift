//
//  MainViewModal.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 16/10/2024.
//

import SwiftUI

class MainViewModal : ObservableObject  {
    
    static var shared: MainViewModal = MainViewModal();
    
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    init() {
        #if DEBUG
        txtEmail = "bystro@gmail.com"
        txtPassword = "Test123@"
        #endif
    }
    
    //MARK : SERVICE-CALL
     
    func serviceCallLogim() {
        
        if(txtEmail.isEmpty){
            self.showError = true
            self.errorMessage = "email is required"
            return
        }
        
        if(!txtEmail.isValidEmail){
            self.showError = true
            self.errorMessage = "Please enter valid email address"
            return
        }
        
        if(txtPassword.isEmpty){
                self.showError = true
                self.errorMessage = "password is required"
                return
        }

        ServiceCall.post(parameter: ["username" : txtEmail , "password" : txtPassword], path: "\(Globs.Base_URL)\(Globs.SV_LOGIN)?fcmToken=token") { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: "status") as? String == "success" {
                    print(response)
                }else{
                    self.showError = true
                    self.errorMessage = "Invalid email or password"
                }
            }
        } failure: { error in
            DispatchQueue.main.async {
                self.showError = true
                self.errorMessage = error!.localizedDescription
            }
        }
    }
}


struct ResponseObj: Codable {
    let status: String?  // Ensure status is a String here
    let message: String?
}
