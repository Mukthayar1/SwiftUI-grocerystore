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
                    .font(.customfont(.bold, fontSize: 48))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal,20)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
}
