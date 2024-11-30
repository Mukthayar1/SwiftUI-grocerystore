//
//  CartModel.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 30/11/2024.
//

import Foundation

struct CartModel :Identifiable , Codable , Equatable {
    var id : UUID = UUID()
    var product : ProductModel
    var quantity : Int
    
    var totalPrice : Double {
        let price = product.OfferPrice ?? product.ProductPrice
        return price * Double(quantity)
    }
    
    // Custom initializer
        init(product: ProductModel, quantity: Int = 1) {
            self.product = product
            self.quantity = quantity
        }

        // If your CartModel expects a dictionary instead, adjust accordingly
        init(dict: [AnyHashable: Any]) {
            let productDict = dict["product"] as? [AnyHashable: Any] ?? [:]
            self.product = ProductModel(dict: productDict as NSDictionary)
            self.quantity = dict["quantity"] as? Int ?? 1
        }
    
    static func == (lhs: CartModel, rhs: CartModel) -> Bool {
        return lhs.product.id == rhs.product.id
    }
}
