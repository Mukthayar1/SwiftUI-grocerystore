//
//  CartView.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 30/11/2024.
//

import SwiftUI

struct CartView: View {
    
    @StateObject private var cartVM = CartViewModal.shared

    var body: some View {
        ZStack{
            if(cartVM.cartList.count == 0){
                Text("Ops! Cart is empty")
                    .font(.customfont(.bold, fontSize: 20))
                    .frame(height: 50)
            }
            ScrollView{
                LazyVStack{
                    ForEach(cartVM.cartList) { cartItem in
                        CartCard(cartItem: cartItem)
                    }
                }
                .padding(20)
                .padding(.bottom,.bottomInsets+45)
            }
            .padding(.top,.topInsets+45)
            
            VStack{
                HStack{
                    Spacer()
                    Text("My Cart")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 50)
                    Spacer()
                }
                .padding(.top,.topInsets)
                .background(Color.white)
                .shadow(color: Color.black, radius: 0.2)
                Spacer()
                if(cartVM.cartList.count > 0){
                    Button{
                        
                    }
                    label:{
                        ZStack{
                                Text("Check Out")
                                .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                  
                                HStack{
                                    Spacer()
                                    Text("$\(cartVM.totalAmount, specifier: "%.2f")")
                                        .font(.customfont(.semibold, fontSize: 12))
                                        .foregroundColor(.white)
                                        .padding(.horizontal,8)
                                        .padding(.vertical,4)
                                        .background(Color.darkGray.opacity(0.5))
                                        .cornerRadius(8)
                                }
                                .padding(.trailing,10)
                        }
                    }
                    .frame(minWidth: 0 , maxWidth: .infinity , minHeight: 60,maxHeight: 60)
                    .foregroundColor(.white)
                    .background(Color.primaryApp)
                    .cornerRadius(15)
                    .padding(.horizontal,20)
                    .padding(.bottom,.bottomInsets+80)
                }
            }
        }
        .alert(isPresented: $cartVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(cartVM.errorMessage), dismissButton: .default(Text("OK")))
        })
        .ignoresSafeArea()
        
    }
}

#Preview {
    NavigationView{
        CartView()
    }
}
