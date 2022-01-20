//
//  CoverImageView.swift
//  Africa
//
//  Created by Yuwarajalingam Dinesh on 2022-01-20.
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImages : [CoverImage] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            } //LOOP
        } //TABVIEW
            .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
