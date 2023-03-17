//
//  PortfolioView.swift
//  CryptoTradingApp
//
//  Created by Akif Hasanov on 2.03.2023.
//

import SwiftUI

struct PortfolioView: View {
    
    @State var portfolio: PortfolioCardModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("portfolioBG"))
                    .frame(maxWidth: .infinity)
                    .frame(height: 76)
                    .overlay {
                        HStack{
                            HStack{
                                Circle()
                                    .frame(width: 48,height: 48)
                                    .foregroundColor(Color("portfolioCircleBG"))
                                    .overlay {
                                        portfolio.logo
                                    }
                                VStack(alignment: .leading){
                                    Text(portfolio.title)
                                        .font(.system(size: 20, weight: .semibold))
                                    Text(portfolio.subtitle)
                                        .font(.system(size: 12, weight: .regular))
                                }
                            }
                            
                            Spacer()
                            
                            portfolio.graph
                            
                            Spacer()
                            
                            VStack{
                                HStack{
                                    Text(portfolio.marketPrice)
                                        .font(.system(size: 16, weight: .bold))
                                    Text("USD")
                                        .font(.system(size: 12, weight: .regular))
                                }
                                HStack{
                                    portfolio.triangle
                                    Text(portfolio.percentage)
                                        .foregroundColor(portfolio.percentageColor)
                                        .font(.system(size: 12, weight: .semibold))
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView(portfolio: portfolioCardItems[0])
            .preferredColorScheme(.dark)
    }
}
