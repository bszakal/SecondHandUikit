//
//  FavouriteHeartView.swift
//  SecondHand3
//
//  Created by Benjamin Szakal on 23/11/22.
//

import SwiftUI

struct FavouriteHeartView: View {
    
    let isAFavourite: Bool
    let isLoggedIn: Bool?
    let completioHandlerOnTap: () ->Void
    @State private var scaleEffectFavChange = 1.0
    var body: some View {
        
        Image(systemName: isAFavourite ? "heart.fill" : "heart")
            .contentShape(Rectangle())
            .foregroundColor(isAFavourite ? .red : .primary)
            .onTapGesture {
                completioHandlerOnTap()
                if let safeIsLoggedIn = isLoggedIn, safeIsLoggedIn == true {
                    Task{
                            scaleEffectFavChange = 2
                        try await Task.sleep(nanoseconds: 200_000_000)
                            scaleEffectFavChange = 1
                        
                    }
                }
            }
            .modifier(animatedFavChange(scaleEffectFav: scaleEffectFavChange))
    }
}

struct animatedFavChange: ViewModifier {
    var scaleEffectFav: Double
    func body(content: Content) -> some View {
        content
            .scaleEffect(scaleEffectFav).animation(.default.repeatCount(1, autoreverses: true),
                                                   value: scaleEffectFav)
    }
}

struct FavouriteHeartView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteHeartView( isAFavourite: true, isLoggedIn: true, completioHandlerOnTap: {})
    }
}
