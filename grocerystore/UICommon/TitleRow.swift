//
//  TitleRow.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 09/11/2024.
//

import SwiftUI

struct TitleRow: View {
    
    @State var title : String = "Title"
    @State var subTitle : String = "Subtitle"
    var didPress : (()->())?

    
    var body: some View {
        HStack{
            Text(title)
                .font(.customfont(.semibold, fontSize: 24))
                .foregroundColor(.primaryText)
            
            Spacer()
            
            Text(subTitle)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primaryApp)
            
        }
    }
}

#Preview {
    TitleRow().padding(20)
}
