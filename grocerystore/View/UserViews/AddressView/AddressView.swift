//
//  AddressView.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 01/12/2024.
//

import SwiftUI

struct AddressView: View {
    
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var AdressVM = AddressViewModal.shared
    
    var body: some View {
        ZStack{
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(AdressVM.addressList, id: \.id) { adItem in
                        HStack{
                            VStack{
                                Text(adItem.name)
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, .topInsets + 80)
                .padding(.bottom, .bottomInsets + 45)
            }

            
            
            
            VStack{
                HStack{
                    
                    Button{
                        mode.wrappedValue.dismiss()
                    }label:{
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                    }
                    
                    Spacer()
                    Text("Delivery Address")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 50)
                    Spacer()
                    
                    Button{
                        
                    }label:{
                        Image("add_green")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                            
                    }
                }
                .padding(.top,.topInsets)
                .padding(.horizontal,20)
                .background(Color.white)
                .shadow(color: Color.black, radius: 0.2)
                Spacer()
                
            }
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    AddressView()
}
