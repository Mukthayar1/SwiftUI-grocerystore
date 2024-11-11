//
//  NutritionistModel.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 11/11/2024.
//

import Foundation

//
//  TypeModel.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 10/11/2024.
//

import Foundation
import SwiftUICore

struct NutritionistModal: Identifiable, Equatable {
    
    var id: Int
    var NutritionName: String = ""
    var NutritionValue: String = ""

    // Initialize from a dictionary
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "nutrition_id") as? Int ?? 0
        self.NutritionName = dict.value(forKey: "nutrition_name") as? String ?? ""
        self.NutritionValue = dict.value(forKey: "nutrition_value") as? String ?? ""
    }

    static func == (lhs: NutritionistModal, rhs: NutritionistModal) -> Bool {
        return lhs.id == rhs.id
    }
}
