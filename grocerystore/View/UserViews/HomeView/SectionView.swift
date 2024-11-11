//
//  SectionView.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 10/11/2024.
//

import SwiftUI

struct SectionView: View {
    
        let title: String
        let subTitle: String
        let categoryShow: Bool
        let listData: [ProductModel]
        let catListData: [TypeModel]
    
    var body: some View {
        VStack{
            TitleRow(title: title,subTitle: subTitle)
                .padding(.horizontal, 15)
            
            if(categoryShow)
            { ScrollView(.horizontal){
                LazyHStack(spacing: 15){
                    ForEach(catListData , id : \.id){
                        tobj in
                        CategoryCard(tobj: tobj){
                            
                        }
                    }
                }
                .padding(.horizontal,20)
            }.padding(.bottom, 15)
            }
            
            ScrollView(.horizontal){
                LazyHStack(spacing: 15){
                    ForEach(listData , id : \.id){
                        pobj in
                        ProductCard(pobj:pobj) {
                            
                        }
                            
                        
                    }
                }
                .padding(.horizontal,20)
            }.padding(.bottom, 15)
        }
        
    }
}

#Preview {
    SectionView(
           title: "Exclusive Offers",
           subTitle: "see all",
           categoryShow: true,
           listData: [ProductModel](), // Provide sample data here if needed
           catListData: [TypeModel]()
       )
}
