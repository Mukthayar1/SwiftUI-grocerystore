//
//  LoginView.swift
//  grocerystore
//
//  Created by Muhammad Mukhtayar on 14/10/2024.
//

import SwiftUI
import CountryPicker

struct LoginView: View {
    
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @State var loginVM = MainViewModal.shared;
    
    @State private var isShow: Bool = false
    
    var body: some View {
        ZStack{
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width : .screenWidth, height : .screenHeight)
            
            VStack{
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50,height: 50)
                    .padding(.bottom,.screenWidth * 0.1)
                    .padding(.top)
                Text("Loging")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0 , maxWidth: .infinity , alignment: .leading)
                    .padding(.bottom,4)
                Text("Enter your email and password")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0 , maxWidth: .infinity , alignment: .leading)
                    .padding(.bottom,.screenWidth * 0.12)
                
                LineTextField( title: "Email", placholder: "Enter your email address", txt: $loginVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.07)
                LineSecureField( title: "Password", placholder: "Enter your password", txt: $loginVM.txtPassword, isShowPassword: $isShow)
                    .padding(.bottom, .screenWidth * 0.04)
                
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.primaryText)
                }
                .frame(minWidth : 0 , maxWidth: .infinity, alignment:.trailing)
                .padding(.bottom, .screenWidth * 0.02)
                
                RoundButton(buttontitle: "Login") {
                    loginVM.serviceCallLogim()
                }
                .padding(.bottom, .screenWidth * 0.05)
                
                HStack{
                    Text("Don't have an account?")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.primaryText)
                    Text("Signuo")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.primaryApp)
                }
                
                Spacer()
                
            }
            .padding(.top,.topInsets+64)
            .padding(.horizontal)
            .padding(.bottom)
            
            VStack{
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20 , height: 20)
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
            }
            .padding(.top,.topInsets)
            .padding(.horizontal)
            
        }
        .alert(isPresented: $loginVM.showError){
            Alert(title: Text(Globs.AppName),message: Text(loginVM.errorMessage),dismissButton: .default(Text("OK"))
        )}
        .background(Color.white)
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    LoginView()
}
