//
//  SearchTextField.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 09/11/2024.
//

import SwiftUI

struct SearchTextField: View {
    
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
            TextField(placholder, text: $txt)
                .font(.customfont(.regular, fontSize: 18))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth:0,maxWidth: .infinity)
        }
        .frame(height: 35)
        .padding(10)
        .background(Color(hex:"F3F3F2"))
        .cornerRadius(10, corner: .allCorners)
    }
    
}

#Preview {
    @State var txt : String = ""
    SearchTextField(placholder: "Search Store", txt: $txt)
        .padding(15)
}
