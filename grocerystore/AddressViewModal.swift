//
//  AddressViewModal.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 01/12/2024.
//

import Foundation


class AddressViewModal : ObservableObject {
    
    static var shared : AddressViewModal = AddressViewModal();
    
    @Published var addressList: [AddressModel] = []
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    init() {
        fetchAddressData()
    }

    func fetchAddressData() {
        ServiceCall.post(parameter: [:], path: Globs.addressListItem, isToken: true) { responseObj in
            if let response = responseObj as? [String: Any],
               let status = response[KKey.status] as? String,
               status == "1",
               let payload = response[KKey.payload] as? [[String: Any]] {
                
                self.addressList = payload.compactMap { AddressModel(dict: $0) }
                self.showError = false
                self.errorMessage = ""
            } else {
                self.handleFailure(error: nil)
            }
        } failure: { error in
            self.handleFailure(error: error)
        }
    }
    
    private func handleFailure(error: Error?) {
        self.showError = true
        self.errorMessage = error?.localizedDescription ?? "An unknown error occurred."
    }

}
