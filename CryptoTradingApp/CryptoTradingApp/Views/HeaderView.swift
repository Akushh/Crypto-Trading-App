//
//  HeaderView.swift
//  CryptoTradingApp
//
//  Created by Akif Hasanov on 2.03.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            Text("My Dashboard")
                .font(.system(size: 24, weight: .bold))
            Spacer()
            HStack(spacing: 15){
                Image("magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18, height: 18)
                Image("bell")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18, height: 18)
                    .overlay {
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.black)
                            .overlay(
                                Circle()
                                    .frame(width: 8, height: 8)
                                    .foregroundColor(Color("purpleColor"))
                            )
                            .offset(x: 5, y: -3.5)
                    }
            }
        }
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .preferredColorScheme(.dark)
    }
}
