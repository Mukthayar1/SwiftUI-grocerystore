//
//  TypeModel.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 10/11/2024.
//

import Foundation
import SwiftUICore

struct TypeModel: Identifiable, Equatable {
    
    var id: Int
    var TypeId: Int = 0
    var TypeName: String = ""
    var TypeImage: String = ""
    var TypeColor: Color = Color.primaryApp

    // Initialize from a dictionary
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "type_id") as? Int ?? 0
        self.TypeId = dict.value(forKey: "type_id") as? Int ?? 0
        self.TypeName = dict.value(forKey: "type_name") as? String ?? ""
        self.TypeImage = dict.value(forKey: "image") as? String ?? ""
        self.TypeColor = Color(hex: dict.value(forKey: "color") as? String ?? "000000")
    }

    static func == (lhs: TypeModel, rhs: TypeModel) -> Bool {
        return lhs.id == rhs.id
    }
}
