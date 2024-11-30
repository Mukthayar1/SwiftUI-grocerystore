//
//  ExploreView.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 20/10/2024.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var ExploreVM = ExploreViewModal.shared
    
    var colums = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
    ]
    
    var body: some View {
        ZStack{
            VStack{
                
                HStack{
                    Spacer()
                    Text("Find Products")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 45)
                    Spacer()
                    
                }
                .padding(.top,.topInsets)
                
                SearchTextField(placholder: "Search Store", txt: $ExploreVM.searchText)
                    .padding(.horizontal, 15)
                    .padding(.bottom,10)
                
                Spacer()
                
                ScrollView{
                    LazyVGrid(columns: colums, spacing: 15){
                        ForEach(ExploreVM.exporeList, id: \.id) { Cobj in
                            NavigationLink {
                                ExploreItemView(exploreItem: (ExploreItemModal(catObj:Cobj)))
                            } label: {
                                ExploreCard(Cobj: Cobj){
                                }
                                .aspectRatio(0.95, contentMode: .fill)
                            }

                            
                           
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    .padding(.bottom,.bottomInsets + 60)
                }
                
            }
        }
        .alert(isPresented: $ExploreVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(ExploreVM.errorMessage) , dismissButton: .default(Text("Ok"))  )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        ExploreView()
    }

}

