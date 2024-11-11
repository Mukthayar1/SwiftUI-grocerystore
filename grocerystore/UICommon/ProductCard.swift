//
//  ProductCard.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 09/11/2024.
//

import SwiftUI

struct ProductCard: View {
    
    @State var pobj: ProductModel = ProductModel(dict: [:])
    
    var didAddCart : (()->())?
    
    var body: some View {
        VStack{
            
            AsyncImage(url: URL(string: pobj.ProductIamge)) { phase in
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
            .frame(width: 100, height: 80)
            
            Spacer()
            
            Text(pobj.ProductName)
                .font(.customfont(.bold, fontSize: 18))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .center)
            
            Text("\(pobj.UnitValue)\(pobj.UnitName), price")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.secondaryText)
                .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .center)
            
            Spacer()
            
            HStack{
                Text("$\(pobj.OfferPrice ?? pobj.ProductPrice , specifier: "%.2f")")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .leading)
                
                Button{
                    didAddCart!()
                } label: {
                    Image("add")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .frame(width: 40,height: 40)
                .background(Color.primaryApp)
                .cornerRadius(10, corner: .allCorners)
            }
            
        }
        .padding(15)
        .frame( width : 180 , height : 230)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.placeholder.opacity(0.5) , lineWidth: 1)
        )
    }
}

#Preview {
    ProductCard()
}
