//
//  AccountView.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 01/12/2024.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Image("u1")
                        .resizable()
                        .scaledToFit()
                        .frame(width:60,height:60)
                        .cornerRadius(30)
                    
                    VStack{
                        HStack{
                            Text("Muhammad Mukthayar")
                                .font(.customfont(.bold, fontSize: 18))
                                .foregroundColor(.primaryText)
                            
                            Image(systemName: "pencil")
                                .foregroundColor(.primaryApp)
                            Spacer()
                        }
                        .padding(.bottom,2)
                        
                        Text("khanadil1000s@gmail.com")
                            .font(.customfont(.regular, fontSize: 14))
                            .accentColor(.secondaryText)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        
                    }
                    .frame(minWidth: 0,maxWidth: .infinity)
                }
                .padding(.horizontal,20)
                .padding(.top,.topInsets)
                
                Divider()
                ScrollView{
                    LazyVStack{
                        VStack{
                            AccountListItem(itemIcon: "a_order", itemTitle: "Orders")
                            AccountListItem(itemIcon: "a_my_detail", itemTitle: "My Details")
                            AccountListItem(itemIcon: "a_delivery_address", itemTitle: "Delivery Address")
                            AccountListItem(itemIcon: "paymenth_methods", itemTitle: "Payment Methods")
                        }
                        VStack{
                            AccountListItem(itemIcon: "a_promocode", itemTitle: "Promo Code")
                            AccountListItem(itemIcon: "a_noitification", itemTitle: "Notifications")
                            AccountListItem(itemIcon: "a_help", itemTitle: "Help")
                            AccountListItem(itemIcon: "a_about", itemTitle: "About")
                        }
                    }
                }
                Spacer()
                
                Button {
                    MainViewModal.shared.logOut()
                } label: {
                    HStack{
                        Image("logout")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25,height: 25)
                            .foregroundColor(.primaryApp)
                        
                        Text("LOG OUT")
                            .font(.customfont(.bold, fontSize: 14))
                            .foregroundColor(.primaryApp)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .center)
                    }
                    .padding(.horizontal,20)
                }
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(minWidth : 0 , maxWidth: .infinity , minHeight : 60 , maxHeight : 60)
                .background(Color(hex: "f2f3f3"))
                .cornerRadius(15, corner: .allCorners)
                .padding(.horizontal,20)
                .padding(.bottom,.bottomInsets)
            }
            .padding(.bottom,.bottomInsets+60)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AccountView()
}
