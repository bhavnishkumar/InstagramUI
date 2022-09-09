//
//  Layout1.swift
//  InstagramUI
//
//  Created by Admin on 09/09/22.
//

import SwiftUI
import SDWebImageSwiftUI

var width = UIScreen.main.bounds.width
struct Layout1: View {
    var cards: [Card]
    
    var body: some View {
        HStack(spacing:4){
            
            AnimatedImage(url: URL(string: cards[0].downloadURL))
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: (width / 3), height: (width / 3) * 2)
                .cornerRadius(4)
            
            HStack{
                VStack(spacing:2){
                    
                    AnimatedImage(url: URL(string: cards[1].downloadURL))
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width:  (width / 3), height:  (width / 3))
                        .cornerRadius(4)
                    
                    AnimatedImage(url: URL(string: cards[safe:2]?.downloadURL ?? ""))
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width:  (width / 3), height:  (width / 3))
                        .cornerRadius(4)
                }
            VStack(spacing:2){
                    
                AnimatedImage(url: URL(string: cards[safe:3]?.downloadURL ?? ""))
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width:   (width / 3), height:  (width / 3))
                        .cornerRadius(4)
                    
                AnimatedImage(url: URL(string: cards[safe: 4]?.downloadURL ?? ""))
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width:  (width / 3), height:  (width / 3))
                        .cornerRadius(4)
                }
            }
        }
    }
}


struct Layout1_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


extension Collection {
  subscript(safe index: Index) -> Iterator.Element? {
    guard indices.contains(index) else { return nil }
    return self[index]
  }
}