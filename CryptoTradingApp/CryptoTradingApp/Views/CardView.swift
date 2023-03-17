//
//  CardView.swift
//  CryptoTradingApp
//
//  Created by Akif Hasanov on 2.03.2023.
//

import SwiftUI

struct CardView: View {
    
    @State var balance: String = "$36,243"
    
    var body: some View {
        
        VStack{
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 343, height: 154)
                .overlay(
                    Image("CardBG")
                        .mask{
                            RoundedRectangle(cornerRadius: 16)
                        }
                )
                .overlay {
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("TOTAL BALANCE")
                                    .font(.system(size: 11, weight: .medium))
                                    .kerning(1.5)
                                
                                HStack(spacing: 4){
                                    Text(balance)
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(Color("cardDarkColor"))
                                    RoundedRectangle(cornerRadius: 24)
                                        .fill(.black)
                                        .frame(width: 65, height: 21)
                                        .overlay {
                                            HStack(spacing: 2){
                                                Image("CardTriangle")
                                                Text("+0.8%")
                                                    .font(.system(size: 12, weight: .semibold))
                                                    .foregroundColor(Color("cardGreenColor"))
                                            }
                                            .padding(.horizontal, 7)
                                            .padding(.vertical, 2)
                                        }
                                        
                                }
                            }
                            
                            Spacer()
                            
                            VStack{
                                Image("CardPlusIcon")
                                Text("Top Up")
                                    .font(.system(size: 12, weight: .semibold))
                            }
                        }
                        
                        HStack{
                            VStack{
                                Image("CardWithdrawIcon")
                                Text("With Draw")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.black)
                            }
                            .frame(width: 100, height: 60)
                            VStack{
                                Image("CardScanIcon")
                                Text("Scan")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.black)
                            }
                            .frame(width: 100, height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 48)
                                    .stroke(style: .init(lineWidth: 1.5))
                                    .opacity(0.5)
                            )
                            VStack{
                                Image("CardRecieveIcon")
                                Text("Recieve")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.black)
                            }
                            .frame(width: 100, height: 60)
                        }
                    }
                    .padding(.horizontal, 16)
                }
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .preferredColorScheme(.dark)
    }
}
