//
//  LoginView.swift
//  grocerystore
//
//  Created by Muhammad Mukhtayar on 14/10/2024.
//

import SwiftUI
import CountryPicker

struct SignupView: View {
    
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @ObservedObject var mainVm = MainViewModal.shared;
    
    
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
                Text("Sign Up")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0 , maxWidth: .infinity , alignment: .leading)
                    .padding(.bottom,4)
                Text("Enter your details to continue")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0 , maxWidth: .infinity , alignment: .leading)
                    .padding(.bottom,.screenWidth * 0.12)
                
                LineTextField( title: "User Name", placholder: "Enter your user name", txt: $mainVm.txtUserName)
                    .padding(.bottom, .screenWidth * 0.07)
                LineTextField( title: "Email", placholder: "Enter your email address", txt: $mainVm.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.07)
                LineSecureField( title: "Password", placholder: "Enter your password", txt: $mainVm.txtPassword, isShowPassword: $isShow)
                    .padding(.bottom, .screenWidth * 0.04)
                
                VStack {
                    Text("By continue you to agree")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    HStack{
                        Text("Terms of Services")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.primaryApp)
                        Text(" and ")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.secondaryText)
                        Text("Privacy Policy")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.primaryApp)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    }
                    .padding(.bottom, .screenWidth * 0.02)
                }
                
               

                
                RoundButton(buttontitle: "Signup") {
                    mainVm.serviceCallSignup()
                }
                .padding(.bottom, .screenWidth * 0.05)
                
                NavigationLink {
                    LoginView()
                } label: {
                    HStack{
                        Text("Already have an account?")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryText)
                        Text("Login")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryApp)
                    }
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
        .alert(isPresented: $mainVm.showError){
            Alert(title: Text(Globs.AppName),message: Text(mainVm.errorMessage),dismissButton: .default(Text("OK"))
        )}
        .background(Color.white)
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
//        .onTapGesture {
//            UIApplication.shared.endEditing(true)
//        }
    }
}

#Preview {
    NavigationView {
        SignupView()
    }
}
