//
//  Home.swift
//  CryptoTradingApp
//
//  Created by Akif Hasanov on 2.03.2023.
//

import SwiftUI

struct TradeActivityModel: Identifiable{
    let id = UUID().uuidString
    let currency: String
    let enterAt: String
    let expired: String
    let leverage: String
}

struct Home: View {
    @Namespace var animation
    @State var selectedDetail: MarketCardModel = marketCardItems[0]
    @State var showDetailView: Bool = false
    @State var times: [String] = [
        "5m", "20m", "35m", "50m", "1h"
    ]
    @State var selectedTime: String = "5m"
    let tradeActivityItems: [TradeActivityModel] = [
        TradeActivityModel(currency: "USD/BTC", enterAt: "12.675", expired: "19:24:53", leverage: "25x"),
        TradeActivityModel(currency: "USD/ETH", enterAt: "11.345", expired: "20:22:51", leverage: "30x"),
        TradeActivityModel(currency: "BTC/USD", enterAt: "16.235", expired: "21:15:30", leverage: "5x"),
        TradeActivityModel(currency: "ETH/APPL", enterAt: "14.146", expired: "22:46:12", leverage: "35x"),
        TradeActivityModel(currency: "ETH/ETH", enterAt: "10.347", expired: "23:23:35", leverage: "20x"),

    ]

    var body: some View {
        VStack {
            
            //MARK: Header View
            
            if showDetailView != true {
                HeaderView()
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
            }
            
            ZStack{
                Color.black.ignoresSafeArea()
                
                //MARK: DetailView
                ZStack{
                    Color.black.ignoresSafeArea()
                    
                    VStack {
                        HStack{
                            Image(systemName: "chevron.left")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 20)
                                .onTapGesture {
                                    withAnimation(.easeInOut){
                                        showDetailView = false
                                    }
                                }
                            Spacer()
                            Text("Statistics")
                                .font(.system(size: 20, weight: .semibold))
                            
                            Spacer()
                            HStack(spacing: 12){
                                Image("star")
                                Image("info")
                            }
                        }
                        .padding(.horizontal)
                        
                        ScrollView (.vertical, showsIndicators: false){
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
                                                        selectedDetail.detailLogo
                                                    }
                                                VStack(alignment: .leading){
                                                    Text(selectedDetail.title)
                                                        .font(.system(size: 20, weight: .semibold))
                                                    Text(selectedDetail.detailSubtitle)
                                                        .font(.system(size: 12, weight: .regular))
                                                }
                                            }
                                            
                                            Spacer()
                                            
                                            selectedDetail.detailGraph
                                            
                                            Spacer()
                                            
                                            VStack{
                                                HStack{
                                                    Text(selectedDetail.marketPrice)
                                                        .font(.system(size: 16, weight: .bold))
                                                }
                                                HStack{
                                                    selectedDetail.detailTriangle
                                                    Text(selectedDetail.percentage)
                                                        .foregroundColor(selectedDetail.detailPercentageColor)
                                                        .font(.system(size: 12, weight: .semibold))
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                    .padding(.top, 30)
                                
                                HStack(spacing: 0){
                                    Text("Time")
                                        .font(.system(size: 14, weight: .regular))
                                    Spacer()
                                    
                                    ForEach(times, id: \.self) { item in
                                        Spacer()
                                        ZStack{
                                            if selectedTime == item{
                                                RoundedRectangle(cornerRadius: 6)
                                                    .foregroundColor(Color("portfolioBG"))
                                                    .frame(width: 40, height: 30)
                                                    .matchedGeometryEffect(id: "animation", in: animation)
                                            }
                                            Text(item)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(width: 42, height: 30)
                                                .onTapGesture {
                                                    withAnimation(.spring()){
                                                        selectedTime = item
                                                    }
                                                }
                                        }
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                    Text("All")
                                        .font(.system(size: 14, weight: .regular))
                                }
                                .padding(.horizontal)
                                .padding(.top, 30)
                                
                                Image("DetailGraph")
                                
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(Color("portfolioBG"))
                                    .frame(height: 120)
                                    .overlay{
                                        VStack(spacing: 16){
                                            HStack{
                                                VStack(alignment: .leading, spacing: 4){
                                                    Text("Price")
                                                        .font(.system(size: 12))
                                                    HStack{
                                                        Text("\(String(format: "%.2f", selectedDetail.detailPrice))")
                                                            .foregroundColor(selectedDetail.detailPrice > 40 ? Color("cardGreenColor") : Color("MarketEthBG"))
                                                        Image(selectedDetail.detailPrice > 40 ? "ArrowUp" : "ArrowDown")
                                                    }
                                                }
                                                Spacer()
                                                VStack(alignment: .leading, spacing: 4){
                                                    Text("24h Change")
                                                        .font(.system(size: 12))
                                                    HStack{
                                                        Text("\(String(format: "%.2f", selectedDetail.detailChange))")
                                                            .foregroundColor(selectedDetail.detailChange > 40 ? Color("cardGreenColor") : Color("MarketEthBG"))
                                                        Image(selectedDetail.detailChange > 40 ? "ArrowUp" : "ArrowDown")
                                                    }
                                                }
                                                Spacer()
                                                VStack(alignment: .leading, spacing: 4){
                                                    Text("24h Low")
                                                        .font(.system(size: 12))
                                                    HStack{
                                                        Text("\(String(format: "%.2f", selectedDetail.detailLow))")
                                                            .foregroundColor(selectedDetail.detailLow > 25 ? Color("cardGreenColor") : Color("MarketEthBG"))
                                                        Image(selectedDetail.detailLow > 25 ? "ArrowUp" : "ArrowDown")
                                                    }
                                                }
                                            }
                                            HStack{
                                                VStack(alignment: .leading, spacing: 4){
                                                    Text("Volume")
                                                        .font(.system(size: 12))
                                                    HStack{
                                                        Text("\(String(format: "%.2f", selectedDetail.detailVolume))")
                                                            .foregroundColor(selectedDetail.detailVolume > 20 ? Color("cardGreenColor") : Color("MarketEthBG"))
                                                        Image(selectedDetail.detailVolume > 20 ? "ArrowUp" : "ArrowDown")
                                                    }
                                                }
                                                Spacer()
                                                VStack(alignment: .leading, spacing: 4){
                                                    Text("Max Cap")
                                                        .font(.system(size: 12))
                                                    HStack{
                                                        Text("\(String(format: "%.2f", selectedDetail.detailMaxCap))")
                                                            .foregroundColor(selectedDetail.detailMaxCap > 20 ? Color("cardGreenColor") : Color("MarketEthBG"))
                                                        Image(selectedDetail.detailChange > 20 ? "ArrowUp" : "ArrowDown")
                                                    }
                                                }
                                                Spacer()
                                                VStack(alignment: .leading, spacing: 4){
                                                    Text("24h High")
                                                        .font(.system(size: 12))
                                                    HStack{
                                                        Text("\(String(format: "%.2f", selectedDetail.detailHigh))")
                                                            .foregroundColor(selectedDetail.detailHigh > 40 ? Color("cardGreenColor") : Color("MarketEthBG"))
                                                        Image(selectedDetail.detailHigh > 40 ? "ArrowUp" : "ArrowDown")
                                                    }
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                    .padding(.horizontal)
                                    .padding(.top, 30)
                                
                                VStack {
                                    Text("Trade Activity")
                                        .font(.system(size: 18, weight: .semibold))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    HStack{
                                        VStack(alignment: .leading, spacing: 16){
                                            Text("CURRENCY")
                                                .font(.system(size: 12))
                                                .foregroundColor(.white.opacity(0.75))
                                            ForEach(tradeActivityItems) { item in
                                                Text(item.currency)
                                            }
                                        }
                                        Spacer()
                                        VStack(alignment: .leading, spacing: 16){
                                            Text("ENTER AT")
                                                .font(.system(size: 12))
                                                .foregroundColor(.white.opacity(0.75))
                                            ForEach(tradeActivityItems) { item in
                                                Text(item.enterAt)
                                            }
                                        }
                                        Spacer()
                                        VStack(alignment: .leading, spacing: 16){
                                            Text("EXPIRED")
                                                .font(.system(size: 12))
                                                .foregroundColor(.white.opacity(0.75))
                                            ForEach(tradeActivityItems) { item in
                                                Text(item.expired)
                                            }
                                        }
                                        Spacer()
                                        VStack(alignment: .trailing, spacing: 16){
                                            Text("LEVERAGE")
                                                .font(.system(size: 12))
                                                .foregroundColor(.white.opacity(0.75))
                                            ForEach(tradeActivityItems) { item in
                                                Text(item.leverage)
                                            }
                                        }
                                    }
                                    .padding(.top, 24)
                                }
                                .padding(.horizontal)
                                .padding(.top, 30)
                                    
                                HStack{
                                    Button {
                                        
                                    } label: {
                                        RoundedRectangle(cornerRadius: 8)
                                            .frame(height: 48)
                                            .frame(maxWidth: .infinity)
                                            .foregroundColor(Color("cardGreenColor"))
                                            .overlay{
                                                Text("Buy")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 14))
                                            }
                                    }
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        RoundedRectangle(cornerRadius: 8)
                                            .frame(height: 48)
                                            .frame(maxWidth: .infinity)
                                            .foregroundColor(Color("MarketEthBG"))
                                            .overlay{
                                                Text("Sell")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 14))
                                            }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.top, 30)
                                
                            }
                        }
                    }
                }
                .offset(x: showDetailView ? 0 : UIScreen.main.bounds.width)
                .zIndex(2)
                
                VStack{
                    ScrollView(.vertical, showsIndicators: false){
                        //MARK: Card View
                        
                        CardView()
                        .padding(.top, 24)
                        .padding(.horizontal, 16)
                        
                        //MARK: Market View
                        
                        HStack{
                            Text("Top Market")
                                .font(.system(size: 16.5, weight: .bold))
                            Spacer()
                            Text("View All")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 24)
                        .padding(.horizontal, 16)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 8){
                                ForEach(marketCardItems) { item in
                                    MarketView(market: item)
                                        .onTapGesture {
                                            withAnimation(.easeInOut){
                                                selectedDetail = item
                                                showDetailView = true
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        
                        //MARK: Portfolio View
                        
                        HStack{
                            Text("Portfolio")
                                .font(.system(size: 16.5, weight: .bold))
                            Spacer()
                            Text("View All")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 24)
                        .padding(.horizontal, 16)
                        
                        VStack(spacing: 8){
                            ForEach(portfolioCardItems) { item in
                                PortfolioView(portfolio: item)
                            }
                        }
                        .padding(.horizontal, 16)
                        
                    }
                }
            }
            
            Spacer()
            
            //MARK: TabView
            RoundedRectangle(cornerRadius: 24)
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .foregroundColor(Color("portfolioBG"))
                .overlay(
                    HStack{
                        Button {
                            
                        } label: {
                            VStack{
                                Image("TabHome")
                                Text("Home")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            }
                        }

                        Spacer()
                        Button {
                            
                        } label: {
                            VStack{
                                Image("TabMarket")
                                Text("Market")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            VStack{
                                Image("TabLogo")
                                    .offset(x: -3, y: -5)
                            }
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            VStack{
                                Image("TabNews")
                                Text("News")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            VStack{
                                Image("TabMenu")
                                Text("Menu")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                        .padding(.horizontal)
                )
                .padding(.horizontal, 16)
                .zIndex(3)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
