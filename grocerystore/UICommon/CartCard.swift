//
//  CartCard.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 30/11/2024.
//

import SwiftUI

struct CartCard: View {
    
    @State var cartItem : CartModel = CartModel(dict: [:])
    
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: URL(string: cartItem.product.ProductIamge)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Image(systemName: "photo")
                    } else {
                        Image(systemName: "photo")
                    }
                }
                .frame(width: 60, height: 60)
                
                VStack(spacing: 4){
                    
                    HStack{
                        Text(cartItem.product.ProductName)
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .leading)
                        Button {
                            CartViewModal.shared.removeItem(cartItem.product)
                        } label: {
                            Image("close")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18,height: 18)
                        }

                    }
                
                    
                    Text("\(cartItem.product.UnitValue)\(cartItem.product.UnitName), price")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom,8)
                    
                    HStack{
                        
                        Button{
                            CartViewModal.shared.decreaseQuantity(of: cartItem.product)
                        } label: {
                            Image("subtack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 17, height: 17)
                                .padding(15)
                        }
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.placeholder.opacity(0.5) , lineWidth: 1)
                        )
                        
                        Text("\(cartItem.quantity)")
                            .font(.customfont(.medium, fontSize: 16))
                            .foregroundColor(.secondaryText)
                            .frame(width: 45,height: 45, alignment: .center)
                            
                        
                        Button{
                            CartViewModal.shared.addOrUpdateItem(cartItem.product)
                        } label: {
                            Image("add_green")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(15)
                        }
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.placeholder.opacity(0.5) , lineWidth: 1)
                        )
                        
                        Spacer()
                        
                        Text("$\(cartItem.totalPrice, specifier: "%.2f")")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.primaryText)
                    }
                }
            }
        }
        Divider()
    }
}

#Preview {
    CartCard()
        .padding(.horizontal,20)
}
