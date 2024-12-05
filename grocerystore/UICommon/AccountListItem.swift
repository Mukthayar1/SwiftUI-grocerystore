//
//  AccountListItem.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 01/12/2024.
//

import SwiftUI

struct AccountListItem: View {
    
    @State var itemIcon : String = ""
    @State var itemTitle : String = ""
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Image(itemIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25,height: 25)
                Text(itemTitle)
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                Image("arrowLeft")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
            }
            .padding(10)
            Divider()
        }
    }
}

#Preview {
    AccountListItem(itemIcon: "a_order", itemTitle: "Orders")
}
