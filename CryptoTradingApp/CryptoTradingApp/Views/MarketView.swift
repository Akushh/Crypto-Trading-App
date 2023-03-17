//
//  MarketView.swift
//  CryptoTradingApp
//
//  Created by Akif Hasanov on 2.03.2023.
//

import SwiftUI

struct MarketView: View {
    @State var market: MarketCardModel
    var body: some View {
        
        RoundedRectangle(cornerRadius: 24)
            .fill(market.color)
            .frame(width: 167.5, height: 160)
            .overlay {
                VStack{
                    VStack{
                        HStack{
                            market.image
                            Text(market.title)
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        HStack {
                            Text(market.marketPrice)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        HStack{
                            Image("MarketTriangle")
                            Text(market.percentage)
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    .offset(y: 12)
                    .padding(.horizontal, 12)
                    market.graph
                }
            }
        
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView(market: marketCardItems[0])
            .preferredColorScheme(.dark)
    }
}
