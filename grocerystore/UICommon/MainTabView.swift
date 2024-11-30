//
//  MainTabView.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 19/10/2024.
//

import SwiftUI

struct MainTabView: View {
    
    @ObservedObject var homeVM = HomeViewModal.shared;
    
    func handleChangeTab(_ index: Int) {
        DispatchQueue.main.async {
            withAnimation {
                homeVM.selectedTab = index
            }
        }
    }
    
    
    var body: some View {
        ZStack{
            if homeVM.selectedTab == 0 {
                HomeView().tag(0)
            } else if homeVM.selectedTab == 1 {
                ExploreView().tag(1)
            } else if homeVM.selectedTab == 2 {
                CartView().tag(2)
            } else if homeVM.selectedTab == 3 {
                FavourtiteView().tag(3)
            } else if homeVM.selectedTab == 4 {
                HomeView().tag(4)
            }
            
            VStack{
                
                Spacer()
                
                HStack {
                    CustomTabView(tabViewImage: "store_tab", title: "Shop",isActive: homeVM.selectedTab == 0 ? true : false ,didPress: {handleChangeTab(0)})
                    
                    CustomTabView(tabViewImage: "explore_tab", title: "Explore",isActive: homeVM.selectedTab == 1 ? true : false,didPress: {handleChangeTab(1)})
                    
                    CustomTabView(tabViewImage: "cart_tab", title: "Cart",isActive: homeVM.selectedTab == 2 ? true : false,didPress: {handleChangeTab(2)})
                    
                    CustomTabView(tabViewImage: "fav_tab", title: "Favourite",isActive: homeVM.selectedTab == 3 ? true : false,didPress: {handleChangeTab(3)})
                    
                    CustomTabView(tabViewImage: "account_tab", title: "Account",isActive: homeVM.selectedTab == 4 ? true : false,didPress: {handleChangeTab(4)})
                }
                .padding(.bottom , .bottomInsets)
                .padding(.top,20)
                .padding(.horizontal,10)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color : Color.black.opacity(0.15), radius : 3, x: 0, y: -3)
            }
            .ignoresSafeArea()
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .onAppear() {
                homeVM.getHomeData()
            }
        }
    }
}

#Preview {
    NavigationView{
        MainTabView()
    }
}

