//
//  Layout2.swift
//  InstagramUI
//
//  Created by Admin on 09/09/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct Layout2: View {
    var cards: [Card]
    
    var body: some View {
        HStack(spacing:4){
            
            AnimatedImage(url: URL(string: cards[safe: 0]?.downloadURL ?? ""))
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width:  (width / 3), height:  (width / 3))
                .cornerRadius(4)
            
            AnimatedImage(url: URL(string: cards[safe:1]?.downloadURL ?? ""))
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width:  (width / 3), height:  (width / 3))
                .cornerRadius(4)
            
            AnimatedImage(url: URL(string: cards[safe:2]?.downloadURL ?? ""))
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width:   (width / 3), height:  (width / 3))
                .cornerRadius(4)
            
            
        }
    }
}


struct Layout2_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
