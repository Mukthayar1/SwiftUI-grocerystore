//
//  HomeViewModal.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 20/10/2024.
//

import SwiftUI

class HomeViewModal : ObservableObject {
    
    static var shared : HomeViewModal = HomeViewModal();
    
    @Published var selectedTab : Int = 0
    @Published var searchText : String = ""
    
    @Published var exclusiveOffersProducts : [ProductModel] = []
    @Published var bestSellingProducts : [ProductModel] = []
    @Published var listOffersProducts : [ProductModel] = []
    @Published var TypeProducts : [TypeModel] = []
    
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    init() {
        getHomeData()
      }
    
    
    //GET DATA
    func getHomeData() {
        ServiceCall.post(parameter: [:], path: Globs.homeData , isToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                
                if (response.value(forKey: KKey.status) as? String ?? "") == "1" {
                    
                    if let payLoad = response.value(forKey: KKey.payload) as? NSDictionary {
                        
                        self.exclusiveOffersProducts = (payLoad.value(forKey: "offer_list") as? NSArray ?? []).map({ obj in
                            let product = ProductModel(dict: obj as! NSDictionary)
                            print("product====>\(product)")
                            return product
                        })
                        
                        self.bestSellingProducts = (payLoad.value(forKey: "best_sell_list") as? NSArray ?? []).map({ obj in
                            let product = ProductModel(dict: obj as! NSDictionary)
                            return product
                        })
                        
                        self.listOffersProducts = (payLoad.value(forKey: "list") as? NSArray ?? []).map({ obj in
                            let product = ProductModel(dict: obj as! NSDictionary)
                            return product
                        })
                        
                        self.TypeProducts = (payLoad.value(forKey: "type_list") as? NSArray ?? []).map({ obj in
                            let typeList = TypeModel(dict: obj as! NSDictionary)
                            return typeList
                        })
                        
                    }
                    
                    self.showError = false;
                    self.errorMessage = "";
                    
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

}
