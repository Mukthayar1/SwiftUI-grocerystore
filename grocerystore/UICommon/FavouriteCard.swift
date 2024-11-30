//
//  FavouriteCard.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 16/11/2024.
//

import SwiftUI

struct FavouriteCard: View {
    
    @State var fvObj : ProductModel = ProductModel(dict: [:])
    
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: URL(string: fvObj.ProductIamge)) { phase in
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
                    Text(fvObj.ProductName)
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(fvObj.UnitValue)\(fvObj.UnitName), price")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .leading)
                }
                
                Text("$\(fvObj.OfferPrice ?? fvObj.ProductPrice , specifier: "%.2f")")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.primaryText)
                Image("arrowLeft")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
        }
        Divider()
    }
}

#Preview {
    FavouriteCard()
}
