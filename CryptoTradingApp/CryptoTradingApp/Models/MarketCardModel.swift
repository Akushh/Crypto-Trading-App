//
//  MarketCardModel.swift
//  CryptoTradingApp
//
//  Created by Akif Hasanov on 2.03.2023.
//

import SwiftUI

struct MarketCardModel: Identifiable{
    let id = UUID().uuidString
    let color: Color
    let image: Image
    let title: String
    let marketPrice: String
    let percentage: String
    let graph: Image
    
    //DetailView variables
    
    let detailSubtitle: String
    let detailLogo: Image
    let detailGraph: Image
    let detailTriangle: Image
    let detailPercentageColor: Color
    let detailPrice: Double
    let detailChange: Double
    let detailLow: Double
    let detailVolume: Double
    let detailMaxCap: Double
    let detailHigh: Double
}

let marketCardItems: [MarketCardModel] = [
    MarketCardModel(color: Color("MarketBtcBG"), image: Image("btc"), title: "BTC", marketPrice: "12,32 USD", percentage: "+1.31%", graph: Image("MarketBtcGraph"), detailSubtitle: "Bitcoin", detailLogo: Image("portfolioBTC"), detailGraph: Image("PortfolioBtcGraph"), detailTriangle: Image("CardTriangle"), detailPercentageColor: Color("cardGreenColor"), detailPrice: 43.38, detailChange: 43.38, detailLow: 24.67, detailVolume: 24.72, detailMaxCap: 23.24, detailHigh: 56.12),
    MarketCardModel(color: Color("MarketEthBG"), image: Image("eth"), title: "ETH", marketPrice: "12,32 USD", percentage: "-0.49%", graph: Image("MarketEthGraph"), detailSubtitle: "Etherium", detailLogo: Image("portfolioETH"), detailGraph: Image("PortfolioEthGraph"), detailTriangle: Image("RedTriangle"), detailPercentageColor: Color("MarketEthBG"), detailPrice: 38.82, detailChange: 38.82, detailLow: 19.74, detailVolume: 18.63, detailMaxCap: 23.76, detailHigh: 46.38),
    MarketCardModel(color: Color("MarketBtcBG"), image: Image("btc"), title: "BTC", marketPrice: "12,32 USD", percentage: "+1.31%", graph: Image("MarketBtcGraph"), detailSubtitle: "Bitcoin", detailLogo: Image("portfolioBTC"), detailGraph: Image("PortfolioBtcGraph"), detailTriangle: Image("CardTriangle"), detailPercentageColor: Color("cardGreenColor"), detailPrice: 43.38, detailChange: 43.38, detailLow: 24.67, detailVolume: 24.72, detailMaxCap: 23.24, detailHigh: 56.12),
]

