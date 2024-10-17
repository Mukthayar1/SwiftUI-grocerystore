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
    
    //MARK : SERVICE-CALL
     
    func serviceCallLogim() {
        
        print("2=2")
        
        if(txtEmail.isEmpty){
            self.showError = true
            self.errorMessage = "email is required"
            return
        }
        if(txtPassword.isEmpty){
            self.showError = true
            self.errorMessage = "password is required"
            return
        }
        ServiceCall.post(parameter: ["username" : txtEmail , "password" : txtPassword], path: Globs.SV_LOGIN) { responseObj in
            if let response = responseObj {
                print(response)
                self.showError = false
                self.errorMessage = ""
            }
        } failure: { error in
            self.showError = true
            self.errorMessage = error!.localizedDescription
        }
        
        print("showError===>",showError)

    }
}

