//
//  WelcomeView.swift
//  grocerystore
//
//  Created by Muhammad Mukhtayar on 14/10/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
                .frame(width : .screenWidth, height : .screenHeight)
            
            VStack {
                Spacer()
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60,height: 60)
                    .padding(.bottom)
                
                Text("Welcome\nto our store")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text("Get your groceries in as fast as one hour")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,20)
                
                Button("Go To Next") {
                    print("hello world")
                }
                .font(.customfont(.semibold, fontSize: 48))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                
                Spacer().frame(height:60)
            }
            .padding(.horizontal,20)
        }
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
        
}

#Preview {
    WelcomeView()
}
