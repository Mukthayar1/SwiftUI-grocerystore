//
//  CartViewModal.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 29/11/2024.
//
import SwiftUI

class CartViewModal: ObservableObject {
    static let shared = CartViewModal()
    
    @Published var cartList: [CartModel] = []
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    @Published var productDetailQty : Int = 0
    @Published var totalAmount: Double = 0.0
    
    private let cartKey = "cart_items"

    init() {
        loadCart()
    }
    
    func updateList(){
        cartList = cartList
    }
    
    func getProductDetailQty(productID: Int , qty: inout Int) {
        if let data = UserDefaults.standard.data(forKey: cartKey),
           let savedCart = try? JSONDecoder().decode([CartModel].self, from: data) {
            cartList = savedCart
            self.totalAmount = savedCart.reduce(0) { $0 + $1.totalPrice }
            
            // Find the quantity for the specific product
            if let cartItem = cartList.first(where: { $0.product.id == productID }) {
                self.productDetailQty = cartItem.quantity
                qty = cartItem.quantity
            } else {
                self.productDetailQty = 0 // Product not found, set to 0
                qty = 0
            }
        } else {
            self.productDetailQty = 0 // No saved cart, set to 0
            qty = 0
        }
    }
    
    func addOrUpdateItem(_ product: ProductModel, quantity: Int = 1, increaseOnly: Bool = false) {
        if let index = cartList.firstIndex(where: { $0.product.id == product.id }) {
            if increaseOnly {
                cartList[index].quantity += 1
            } else {
                cartList[index].quantity += quantity
            }
        } else {
            cartList.append(CartModel(product: product, quantity: quantity))
        }
        saveCart();
        self.totalAmount = cartList.reduce(0) { $0 + $1.totalPrice }
    }

    func removeItem(_ product: ProductModel) {
        cartList.removeAll { $0.product.id == product.id }
        saveCart()
        self.totalAmount = cartList.reduce(0) { $0 + $1.totalPrice }
    }

    func decreaseQuantity(of product: ProductModel) {
        if let index = cartList.firstIndex(where: { $0.product.id == product.id }) {
            if cartList[index].quantity > 1 {
                cartList[index].quantity -= 1
            } else {
                removeItem(product)
            }
            saveCart()
            self.totalAmount = cartList.reduce(0) { $0 + $1.totalPrice }
        }
    }


    private func saveCart() {
        if let data = try? JSONEncoder().encode(cartList) {
            UserDefaults.standard.set(data, forKey: cartKey)
        }
    }

    private func loadCart() {
        if let data = UserDefaults.standard.data(forKey: cartKey),
           let savedCart = try? JSONDecoder().decode([CartModel].self, from: data) {
            cartList = savedCart
            self.totalAmount = savedCart.reduce(0) { $0 + $1.totalPrice }
        }
    }
}
