//
//  FeedView.swift
//  InstagramUI
//
//  Created by Admin on 30/08/22.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        HStack(spacing: 12){
            Button(action: {}) {
                HStack{
                    
                    
                    Image(uiImage: UIImage.init(named: "Instagram_Logo_Large")!)
                    
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 200, height: 40, alignment: .leading)
                    
                    
                    
                }
            }
            Spacer(minLength: 0)
            
            
            
            Button(action: {}) {
                Image(uiImage: UIImage.init(named: "add")!)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 25, height: 25, alignment: .leading)
                    .foregroundColor(.primary)
                
            }
            Button(action: {}) {
                Image(uiImage: UIImage.init(named: "messanger")!)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 25, height: 25, alignment: .leading)
                    .foregroundColor(.primary)
                
            }
            
            
        }.padding([.horizontal,.top])
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack{
                        ForEach(0 ..< (self.viewModel.hightlights?.count ?? 0)) { value in
                            Button(action: {}) {
                                VStack{
                                    Image(uiImage: UIImage.init(named:self.viewModel.hightlights?[value].hightlightImg ?? "")!)
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                        .cornerRadius(30)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                                        )
                                    Text(self.viewModel.hightlights?[value].hightlightText ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 10))
                                        .fontWeight(.regular)
                                }
                            }.padding(2)
                        }
                    }.padding()
                }
                VStack{
                    ForEach(viewModel.feedlist ?? []) { feed in
                        PostCell(post: feed)
                    }
                }
            }.frame(width: UIScreen.main.bounds.width)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
