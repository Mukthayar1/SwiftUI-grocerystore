//
//  HomeView.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 20/10/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var HomeVM = HomeViewModal.shared;
        
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    HStack{
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        Text("Karachi, Pakistan")
                            .font(.customfont(.semibold, fontSize: 18))
                    }
                    
                    SearchTextField(placholder: "Search Store", txt: $HomeVM.searchText)
                        .padding(.horizontal, 15)
                        .padding(.vertical,10)
                    
                    CustomSlider().padding(.bottom,5)
                    
                    SectionView(
                        title: "Exclusive Offers",
                        subTitle: "see all",
                        categoryShow: false,
                        listData: HomeVM.exclusiveOffersProducts,
                        catListData: []
                    )
                    SectionView(
                        title: "Best Selling",
                        subTitle: "see all",
                        categoryShow: false,
                        listData: HomeVM.bestSellingProducts,
                        catListData: []
                    )
                    SectionView(
                        title: "Groceries",
                        subTitle: "see all",
                        categoryShow: true,
                        listData: HomeVM.listOffersProducts,
                        catListData: HomeVM.TypeProducts
                    )
                }
                .padding(.top , .topInsets)
                .padding(.vertical,20)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
