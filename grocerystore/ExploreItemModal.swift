//
//  ExploreItemModal.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 23/11/2024.
//

import Foundation
import SwiftUI

class ExploreItemModal : ObservableObject {
    
    @Published var Cpobj : ExploreCategoryModel = ExploreCategoryModel(dict: [:]);
    
    @Published var listProduct : [ProductModel] = []
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    init(catObj : ExploreCategoryModel) {
        self.Cpobj = catObj
        getProduct()
    }
    
    //GET DATA
    func getProduct() {
        ServiceCall.post(parameter: ["cat_id":self.Cpobj.id], path: Globs.exporeListItem , isToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                
                if (response.value(forKey: KKey.status) as? String ?? "") == "1" {
                    
                    self.listProduct = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        let list = ProductModel(dict: obj as! NSDictionary)
                        return list
                    })
                    
                    self.showError = false;
                    self.errorMessage = "";
                    
                }else{
                    self.showError = true
                    self.errorMessage = "something went wrong"
                }
            }
        } failure: { error in
            self.showError = true
            self.errorMessage = error!.localizedDescription
        }
    }
    
}
