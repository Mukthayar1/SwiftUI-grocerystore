//
//  CustomSlider.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 09/11/2024.
//

import SwiftUI

struct CustomSlider: View {
    
    @State private var currentPage = 0
    let images = ["banner_top", "banner_top", "banner_top", "banner_top"]
    
    var body: some View {
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(0..<images.count, id: \.self)
                    {
                        index in
                        Image(images[index])
                            .resizable()
                            .scaledToFill()
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(height: 115)
                .cornerRadius(10)
                .padding([.leading, .trailing], 15)
                Spacer()
                .onReceive(timer) { _ in
                    withAnimation {
                        currentPage = (currentPage + 1) % images.count
                    }
                }
            }
        }
        
        let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
}

#Preview {
    CustomSlider()
}
