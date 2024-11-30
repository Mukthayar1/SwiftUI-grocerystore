//
//  FavoutiteView.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 16/11/2024.
//

import SwiftUI

struct FavourtiteView: View {
    
    @StateObject var FVModel = FavouriteViewModal.shared
    
    var body: some View {
        ZStack{
            
            ScrollView{
                LazyVStack{
                    ForEach(FVModel.fvrtListArray,id: \.id, content: {
                        fvObj in
                        FavouriteCard(fvObj:fvObj)
                    })
                }
                .padding(20)
                .padding(.bottom,.bottomInsets+45)
            }
            .padding(.top,.topInsets+45)
            
            
            
            VStack{
                HStack{
                    Spacer()
                    Text("Favorites")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 50)
                    Spacer()
                }
                .padding(.top,.topInsets)
                .background(Color.white)
                .shadow(color: Color.black, radius: 0.2)
                Spacer()
                RoundButton(buttontitle: "Add to Cart"){
                    
                }
                .padding(.horizontal,20)
                .padding(.bottom,.bottomInsets+80)
            }
            
           
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    FavourtiteView()
}
