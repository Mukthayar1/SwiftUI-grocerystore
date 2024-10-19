//
//  LoginView.swift
//  grocerystore
//
//  Created by Muhammad Mukhtayar on 14/10/2024.
//

import SwiftUI
import CountryPicker

struct SigInView: View {
    
    @State var phoneNumber : String = "";
    @State var isCountryPickerVisible : Bool = false;
    @State var countryObj : Country?
    
    
    var body: some View {
        ZStack{
            
            VStack{
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width : .screenWidth, height : .screenWidth)
                Spacer()
            }
            
            ScrollView{
                VStack(alignment: .leading){
                    Text("Get your groceries\nwith nector")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom,25)
                    
                    HStack{
                        Button(action: {
                            isCountryPickerVisible = true
                        }) {
                            if let countryObj = countryObj {
                                Text("\(countryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 35))
                                Text("\(countryObj.phoneCode)")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundColor(.primaryText)
                            }

                        }
                        
                        TextField("Enter your phone number", text: $phoneNumber)
                            .font(.customfont(.medium, fontSize: 18))
                            .foregroundColor(.primary)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .background(Color.white.cornerRadius(10))
                    }
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Login with email")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth : 0 , maxWidth: .infinity , minHeight : 60 , maxHeight : 60)
                    .background(Color.primaryApp)
                    .cornerRadius(15, corner: .allCorners)
                    .padding(.bottom , 8)
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Signup with email")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth : 0 , maxWidth: .infinity , minHeight : 60 , maxHeight : 60)
                    .background(Color(hex : "5384dc"))
                    .cornerRadius(15, corner: .allCorners)
                    .padding(.bottom , 8)

                    
                    Divider()
                        .padding(.bottom,25)
                    
                    Text("or connect with social media")
                        .frame(minWidth: 0,maxWidth: .infinity)
                        .font(.customfont(.semibold, fontSize: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.textTitle)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom,25)
                    
                    Button {
                        
                    } label: {
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20 , height : 20)
                        Text("Continue with Google")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth : 0 , maxWidth: .infinity , minHeight : 60 , maxHeight : 60)
                    .background(Color.primaryApp)
                    .cornerRadius(15, corner: .allCorners)
                    .padding(.bottom , 8)
     
                    Button {
                        
                    } label: {
                        Image("fb_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20 , height : 20)
                        Text("Continue with Google")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth : 0 , maxWidth: .infinity , minHeight : 60 , maxHeight : 60)
                    .background(Color(hex : "5384dc"))
                    .cornerRadius(15, corner: .allCorners)
                }
            }
            .padding(.horizontal,20)
            .frame(width: .screenWidth , alignment: .leading)
            .padding(.top , .topInsets + .screenWidth * 0.6)
            
            
        }
        .onAppear{
            self.countryObj = Country(phoneCode: "+92", isoCode: "PK")
        }
        .sheet(isPresented: $isCountryPickerVisible, content: {
            CountryPickerUI(country: $countryObj)
        })
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationView {
        SigInView()
    }
}
