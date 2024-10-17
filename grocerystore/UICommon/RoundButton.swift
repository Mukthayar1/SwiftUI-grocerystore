//
//  RoundButton.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 16/10/2024.
//

import SwiftUI

struct RoundButton: View {
    
    @State var buttontitle : String = "Title"
    var didPress : (()->())?
    
    var body: some View {
        Button(buttontitle) {
            if let pressAction = didPress {
                pressAction()
            }
           
        }
        .font(.customfont(.semibold, fontSize: 18))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .frame(minWidth : 0 , maxWidth: .infinity , minHeight : 60 , maxHeight : 60)
        .background(Color.primaryApp)
        .cornerRadius(15, corner: .allCorners)
    }
}

#Preview {
    RoundButton()
        .padding(20)
}
