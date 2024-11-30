//
//  ExploreCard.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 23/11/2024.
//

//
//  CategoryCard.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 10/11/2024.
//

import SwiftUI

struct ExploreCard: View {
    
    @State var Cobj : ExploreCategoryModel = ExploreCategoryModel(dict: [:])
    var didAddCart : (()->())?
    
    var body: some View {
        VStack{
            
            AsyncImage(url: URL(string: Cobj.TypeImage)) { phase in
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
            .frame(width: 120, height: 90)
            
            Spacer()
            
            Text(Cobj.TypeName)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .center)

            Spacer()
        }
        .padding(15)
        .background(Cobj.TypeColor.opacity(0.3))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Cobj.TypeColor, lineWidth:1)
        )
    }
}

#Preview {
    ExploreCard()
        .padding(20)
}
