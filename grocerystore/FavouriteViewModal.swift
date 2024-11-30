//
//  FavouriteViewModal.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 16/11/2024.
//

import SwiftUI

class FavouriteViewModal : ObservableObject {
    
    static var shared : FavouriteViewModal = FavouriteViewModal();
    
    @Published var fvrtListArray : [ProductModel] = []
    
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    init() {
        getFvrtData()
      }
    
    //GET DATA
    func getFvrtData() {
        ServiceCall.post(parameter: [:], path: Globs.favoriteList , isToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                print("response",response)
                
                if (response.value(forKey: KKey.status) as? String ?? "") == "1" {
                    
                    self.fvrtListArray = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return ProductModel(dict: obj as! NSDictionary)
                    })
                    
                    self.showError = false;
                    self.errorMessage = "";
                    
                }
            }
        } failure: { error in
            self.showError = true
            self.errorMessage = error!.localizedDescription
        }
    }

}
