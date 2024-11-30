//
//  ExploreViewModal.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 23/11/2024.
//

import Foundation

class ExploreViewModal : ObservableObject {
    
    static var shared : ExploreViewModal = ExploreViewModal();
    
    @Published var searchText : String = "";
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    @Published var exporeList : [ExploreCategoryModel] = [];
    
    init(){
        getExploreList()
    }
    
    
    func getExploreList() {
        ServiceCall.post(parameter: [:], path: Globs.exporeList, isToken: true) { result in
            if let resp = result as? NSDictionary {
                if (resp.value(forKey: KKey.status) as? String ?? "") == "1" {
                    if let payload = resp.value(forKey: KKey.payload) as? NSArray {
                        self.exporeList = payload.compactMap { obj in
                            guard let dict = obj as? NSDictionary else { return nil }
                            return ExploreCategoryModel(dict: dict)
                        }
                    } else {
                        self.exporeList = [] // Default to an empty array if payload is not present.
                    }
                } else {
                    self.showError = true
                    self.errorMessage = "Unable to get products"
                }
            }
        } failure: { error in
            self.showError = true
            self.errorMessage = error?.localizedDescription ?? "An unknown error occurred"
        }
    }
    
}
