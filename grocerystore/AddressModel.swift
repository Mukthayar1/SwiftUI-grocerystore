//
//  AddressModel.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 01/12/2024.
//

import Foundation

struct AddressModel:Identifiable ,Codable ,Equatable {
    
    let id: Int
    let name: String
    let phone: String
    let address: String
    let city: String
    let state: String
    let typeName: String
    let postalCode: String
    let isDefault: Bool
    
    init?(dict: [String: Any]) {
        guard let id = dict["address_id"] as? Int else { return nil }
        self.id = id
        self.name = dict["name"] as? String ?? ""
        self.phone = dict["phone"] as? String ?? ""
        self.address = dict["address"] as? String ?? ""
        self.city = dict["city"] as? String ?? ""
        self.state = dict["state"] as? String ?? ""
        self.typeName = dict["type_name"] as? String ?? ""
        self.postalCode = dict["postal_code"] as? String ?? ""
        self.isDefault = (dict["is_default"] as? Int ?? 0) == 1
    }
    
    static func == (lhs: AddressModel, rhs: AddressModel) -> Bool {
        return lhs.id == rhs.id
    }
}
