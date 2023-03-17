//
//  PortfolioCardModel.swift
//  CryptoTradingApp
//
//  Created by Akif Hasanov on 3.03.2023.
//

import SwiftUI

struct PortfolioCardModel: Identifiable{
    let id = UUID().uuidString
    let logo: Image
    let title: String
    let subtitle: String
    let graph: Image
    let marketPrice: String
    let triangle: Image
    let percentage: String
    let percentageColor: Color
}

let portfolioCardItems: [PortfolioCardModel] = [
    PortfolioCardModel(logo: Image("portfolioBTC"), title: "BTC", subtitle: "Bitcoin", graph: Image("PortfolioBtcGraph"), marketPrice: "$25,93", triangle: Image("CardTriangle"), percentage: "+1.31%", percentageColor: Color("cardGreenColor")),
    PortfolioCardModel(logo: Image("portfolioETH"), title: "ETH", subtitle: "Etherium", graph: Image("PortfolioEthGraph"), marketPrice: "$25,93", triangle: Image("RedTriangle"), percentage: "+1.31%", percentageColor: Color("MarketEthBG")),
    PortfolioCardModel(logo: Image("portfolioBTC"), title: "BTC", subtitle: "Bitcoin", graph: Image("PortfolioBtcGraph"), marketPrice: "$25,93", triangle: Image("CardTriangle"), percentage: "+1.31%", percentageColor: Color("cardGreenColor")),
]
