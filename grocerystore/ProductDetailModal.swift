//
//  ProductDetailModal.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 11/11/2024.
//

import Foundation

import SwiftUI

class ProductDetailModal : ObservableObject {
    
    @Published var pobj : ProductModel = ProductModel(dict: [:])
    @Published var NutritionList : [NutritionistModal] = []
    @Published var ImageList : [ImageModel] = []
    @Published var isFav : Bool = false
    @Published var isShowDetail : Bool = false
    @Published var isShowNutrition : Bool = false
    @Published var qty : Int = 1
    
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    func ShowDetailToggle() {
        self.isShowDetail.toggle()
    }
    
    func ShowNutritionToggle() {
        self.isShowNutrition.toggle()
    }
    
    func AddToCart(isAdd: Bool = true) {
        if(isAdd){
            qty += 1
        }else{
            qty -= 1
            if(qty < 1){
                qty = 1
            }
        }
    }
    
    init(prodObj : ProductModel) {
        self.pobj = prodObj;
        self.isFav = prodObj.IsFav
        getProductDetail()
      }
    
    //GET DATA
    func getProductDetail() {
        ServiceCall.post(parameter: ["prod_id":self.pobj.id], path: Globs.productDetail , isToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                
                if (response.value(forKey: KKey.status) as? String ?? "") == "1" {
                    
                    if let payLoad = response.value(forKey: KKey.payload) as? NSDictionary {
                        
                        self.pobj = ProductModel(dict: payLoad)
                        
                        self.NutritionList = (payLoad.value(forKey: "nutrition_list") as? NSArray ?? []).map({ obj in
                            let nutrition_list = NutritionistModal(dict: obj as! NSDictionary)
                            return nutrition_list
                        })
                        
                        self.ImageList = (payLoad.value(forKey: "images") as? NSArray ?? []).map({ obj in
                            let images = ImageModel(dict: obj as! NSDictionary)
                            return images
                        })
                    }
                    
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
