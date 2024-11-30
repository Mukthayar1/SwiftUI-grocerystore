//
//  ExploreItemView.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 23/11/2024.
//

import SwiftUI
struct ExploreItemView: View {
    
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var exploreItem = ExploreItemModal(catObj:ExploreCategoryModel(dict: [:]))
    
    var colums = [
        GridItem(.flexible(),spacing: 15),
        GridItem(.flexible(),spacing: 15)
    ]
    
    var body: some View {
        ZStack{
            
            VStack {
                
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Text(exploreItem.Cpobj.TypeName)
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(minWidth: 0, maxWidth: .infinity,alignment: .center)
                    
                    Button {
                    } label: {
                        Image("filter_ic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                }
                
                ScrollView{
                    LazyVGrid(columns: colums,spacing: 15) {
                        ForEach(exploreItem.listProduct, id: \.id) { item in
                            ProductCard(pobj: item,width:.infinity){
                                
                            };
                        }
                    }
//                    .padding(.horizontal,20)
                    .padding(.vertical,20)
                    .padding(.bottom,.bottomInsets+60)
                }
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ExploreItemView(exploreItem: ExploreItemModal(catObj: ExploreCategoryModel(dict: [
        "cat_id": 1,
        "cat_name": "Frash Fruits & Vegetable",
        "image": "http://localhost:3001/img/category/20230726155407547qM5gSxkrCh.png",
        "color": "53B175"
    ])))
}
