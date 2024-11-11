//
//  ProductModel.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 10/11/2024.
//

import Foundation

struct ProductModel : Identifiable, Equatable ,Codable {
    
    var id: Int
    var ProdId: Int = 0
    var BrandId: Int = 0
    var TypeId: Int = 0
    var CatId: Int = 0
    var ProductPrice: Double = 0.0
    var ProductDetail: String = ""
    var ProductName: String = ""
    var UnitName: String = ""
    var UnitValue: String = ""
    var OfferPrice: Double?
    var StartDate : Date = Date()
    var EndDate : Date = Date()
    var NutritionWeight : String = ""
    var ProductIamge : String = ""
    var CatName : String = ""
    var TypeName : String = ""
    var IsFav : Bool = false
    

    // Initialize from a dictionary
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "prod_id") as? Int ?? 0
        self.ProdId = dict.value(forKey: "prod_id") as? Int ?? 0
        self.BrandId = dict.value(forKey: "brand_id") as? Int ?? 0
        self.TypeId = dict.value(forKey: "type_id") as? Int ?? 0
        self.CatId = dict.value(forKey: "cat_id") as? Int ?? 0
        self.ProductDetail = dict.value(forKey: "detail") as? String ?? ""
        self.ProductName = dict.value(forKey: "name") as? String ?? ""
        self.ProductPrice = dict.value(forKey: "price") as? Double ?? 0.0
        self.OfferPrice = dict.value(forKey: "offer_price") as? Double
        self.StartDate = (dict.value(forKey: "start_date") as? String)?.stringDateToDate() ?? Date()
        self.EndDate = (dict.value(forKey: "end_date") as? String)?.stringDateToDate() ?? Date()
        self.UnitName = dict.value(forKey: "unit_name") as? String ?? ""
        self.UnitValue = dict.value(forKey: "unit_value") as? String ?? ""
        self.NutritionWeight = dict.value(forKey: "nutrition_weight") as? String ?? ""
        self.CatName = dict.value(forKey: "cat_name") as? String ?? ""
        self.TypeName = dict.value(forKey: "type_name") as? String ?? ""
        self.ProductIamge = dict.value(forKey: "image") as? String ?? ""
        self.IsFav = dict.value(forKey: "is_fav") as? Bool ?? false
    }
    
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return lhs.id == rhs.id
    }
}
