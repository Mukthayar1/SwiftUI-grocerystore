//
//  MainTabView.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 19/10/2024.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var loginVM = MainViewModal.shared;
    
    var body: some View {
        ZStack{
            VStack{
//                Spacer()
                
                HStack{
                    RoundButton(buttontitle: "LOG_OUR",didPress: {
                        MainViewModal.shared.isUserLoggedIn.toggle()
                    })
                }
            }
        }
        .onAppear{
            print("MainViewModal.shared.isUserLoggedIn\(loginVM.isUserLoggedIn)")
            print("MainViewModal.shared.userObject\(loginVM.userObject)")
        }
        .background(Color.white)
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    MainTabView()
}
