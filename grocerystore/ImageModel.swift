//
//  NutritionistModel.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 11/11/2024.
//

import Foundation
import SwiftUICore

struct ImageModel: Identifiable, Equatable {
    
    var id: Int
    var ProductId: Int = 0
    var Image: String = ""

    // Initialize from a dictionary
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "img_id") as? Int ?? 0
        self.ProductId = dict.value(forKey: "prod_id") as? Int ?? 0
        self.Image = dict.value(forKey: "image") as? String ?? ""
    }

    static func == (lhs: ImageModel, rhs: ImageModel) -> Bool {
        return lhs.id == rhs.id
    }
}
