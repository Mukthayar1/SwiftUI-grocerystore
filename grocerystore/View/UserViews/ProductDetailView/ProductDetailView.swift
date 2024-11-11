//
//  ProductDetailView.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 11/11/2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var detailVM: ProductDetailModal = ProductDetailModal(prodObj: ProductModel(dict:[:]))
    
    var body: some View {
        ZStack{
            ScrollView{
                
                ZStack{
                    Rectangle()
                        .foregroundColor( Color(hex: "F2F2F2") )
                        .frame(width: .screenWidth, height: .screenWidth * 0.8)
                        .cornerRadius(20, corner: [.bottomLeft, .bottomRight])
                        .frame(width: .screenWidth, height: .screenWidth * 0.8)
                    
                    AsyncImage(url: URL(string: detailVM.pobj.ProductIamge)) { phase in
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
                    .frame(width: .screenWidth, height: .screenWidth * 0.8)
                }
                .frame(width: .screenWidth, height: .screenWidth * 0.8)
                
                VStack{
                    HStack{
                        Text(detailVM.pobj.ProductName)
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(Color.primaryText)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        
                        Button{
                            detailVM.isFav = !detailVM.isFav
                        } label: {
                            Image(detailVM.isFav ? "favorite" : "fav")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25,height: 25)
                        }
                    }
                    Text("\(detailVM.pobj.UnitValue)\(detailVM.pobj.UnitName), price")
                        .font(.customfont(.medium, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .leading)
                    
                    HStack{
                        
                        Button{
                            detailVM.AddToCart(isAdd: false)
                        } label: {
                            Image("subtack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(15)
                        }
                        
                        Text("\(detailVM.qty)")
                            .font(.customfont(.medium, fontSize: 16))
                            .foregroundColor(.secondaryText)
                            .frame(width: 45,height: 45, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.placeholder.opacity(0.5) , lineWidth: 1)
                            )
                        
                        Button{
                            detailVM.AddToCart(isAdd: true)
                        } label: {
                            Image("add_green")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(15)
                        }
                        
                        Spacer()
                        
                        Text("$\(detailVM.pobj.OfferPrice ?? detailVM.pobj.ProductPrice , specifier: "%.2f")")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                    }
                    .padding(.vertical,8)
                    
                    Divider()
                }
                .padding(.horizontal ,20)
                .padding(.top,20)
                
                VStack{
                    HStack{
                        Text("Product Detail")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(Color.primaryText)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        
                        Button{
                            withAnimation {
                                detailVM.ShowDetailToggle()
                            }
                            
                        } label: {
                            Image(detailVM.isShowDetail ? "down-arrow" : "arrowLeft")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15,height: 15)
                                .padding(15)
                                
                        }
                        .foregroundColor(Color.primaryText)
                    }
                    if(detailVM.isShowDetail){
                        Text("\(detailVM.pobj.ProductDetail)")
                            .font(.customfont(.medium, fontSize: 13))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom,10)
                    }
                    
                    Divider()
                    
                }
                .padding(.horizontal ,20)
                
                VStack{
                    HStack{
                        Text("Nutritions")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(Color.primaryText)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        
                        Text(detailVM.pobj.NutritionWeight)
                            .font(.customfont(.bold, fontSize: 9))
                            .foregroundColor(Color.secondaryText)
                            .padding(8)
                            .background(Color.placeholder.opacity(0.5))
                            .cornerRadius(5)
                        
                        Button{
                            withAnimation {
                                detailVM.ShowNutritionToggle()
                            }
                            
                        } label: {
                            Image(detailVM.isShowNutrition ? "down-arrow" : "arrowLeft")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15,height: 15)
                                .padding(15)
                                
                        }
                        .foregroundColor(Color.primaryText)
                    }
                    if(detailVM.isShowNutrition){
                        LazyVStack{
                            ForEach(detailVM.NutritionList, id: \.id){ item in
                                HStack{
                                    Text(item.NutritionName)
                                        .font(.customfont(.semibold, fontSize: 12))
                                        .foregroundColor(Color.secondaryText)
                                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                                    Text(item.NutritionValue)
                                        .font(.customfont(.semibold, fontSize: 12))
                                        .foregroundColor(Color.primaryText)
                                }
                                .padding(.vertical,5)
                                Divider()
                            }
                        }
                        .padding(5)
                        .padding(.bottom,20)
                    }
                    
                    if (!detailVM.isShowNutrition){
                        Divider()
                    }
                    
                }
                .padding(.horizontal ,20)
                
                VStack{
                    HStack{
                        Text("Review")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(Color.primaryText)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        
                        ForEach(0...4, id: \.self) { star in
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.orange)
                                .frame(width: 15,height: 15)
                        }
                        
                        Divider()
                        
                        Button{
                            
                        } label: {
                            Image("arrowLeft")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15,height: 15)
                                .padding(15)
                                
                        }
                        .foregroundColor(Color.primaryText)
                    }
                    if(detailVM.isShowDetail){
                        Text("\(detailVM.pobj.ProductDetail)")
                            .font(.customfont(.medium, fontSize: 13))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom,10)
                    }
                    
                }
                .padding(.horizontal ,20)
                
                RoundButton(buttontitle: "Add To Cart"){
                    
                }
                .padding(20)
                
            }
            
            
            
            
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
                    
                    Spacer()
                    
                    Button {
                    } label: {
                        Image("share")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        //        .alert(isPresented: $detailVM.showError, content: {
        //
        //            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage)  , dismissButton: .default(Text("Ok"))  )
        //        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}

#Preview {
    ProductDetailView(detailVM: ProductDetailModal(prodObj: ProductModel(dict: [
        "prod_id": 7,
        "cat_id": 1,
        "brand_id": 1,
        "type_id": 1,
        "name": "Oranges",
        "detail": "Many types of oranges are high in fiber and beneficial vitamins, like vitamin C. They also contain antioxidants which can have various health benefits, including supporting immune function.",
        "unit_name": "kg",
        "unit_value": "1",
        "nutrition_weight": "140g",
        "price": 0.99,
        "created_date": "2023-07-31T04:28:17.000Z",
        "modify_date": "2023-07-31T04:28:17.000Z",
        "cat_name": "Frash Fruits & Vegetable",
        "is_fav": 1,
        "brand_name": "bigs",
        "type_name": "Pulses",
        "offer_price": 0.99,
        "image": "http://localhost:3001/img/product/202307310958175817ytVf7AVIOl.png",
        "start_date": "",
        "end_date": "",
        "is_offer_active": 0,
        "avg_rating": 0,
    ])))
}
