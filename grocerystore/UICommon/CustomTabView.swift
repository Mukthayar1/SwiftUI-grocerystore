//
//  CustomTabView.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 20/10/2024.
//

import SwiftUI

struct CustomTabView: View {
    
    var tabViewImage : String = "home"
    var title : String = "Home"
    var isActive : Bool = false
    var didPress : (()->())?
    
    var body: some View {
        Button {
            if let pressAction = didPress {
                pressAction()
            }
        } label: {
            VStack{
                Image(tabViewImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25,height: 25)
                Text(title)
                    .font(.customfont(.medium, fontSize: 14))
            }
        }
        .foregroundColor(isActive ? .primaryApp : .primaryText)
        .frame(minWidth: 0,maxWidth: .infinity)
    }
}

#Preview {
    CustomTabView()
}

