//
//  CategoryCard.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 10/11/2024.
//

import SwiftUI

struct CategoryCard: View {
    
    @State var tobj : TypeModel = TypeModel(dict: [:])
    @State var color : Color = Color.yellow
    var didAddCart : (()->())?
    
    var body: some View {
        HStack{
            
            AsyncImage(url: URL(string: tobj.TypeImage)) { phase in
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
            .frame(width: 70, height: 70)
            
      
            Text(tobj.TypeName)
                .font(.customfont(.bold, fontSize: 18))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .leading)

            
        }
        .padding(15)
        .frame( width : 250 , height : 85)
        .background(tobj.TypeColor.opacity(0.3))
        .cornerRadius(20)
    }
}

#Preview {
    CategoryCard()
}
