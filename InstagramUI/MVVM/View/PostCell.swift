//
//  PostCell.swift
//  InstagramFeed
//
//  Created by Stephen Dowless on 2/27/20.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    let post: Feed
    
    @State var liked = false
    @State var saveFeed = false
    var likedcallback : (Bool) -> ()
    
    var header: some View {
        HStack {
            Image("avtar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading) {
                Text(post.username).font(.system(size: 14)).bold()
                Text(post.location).font(.system(size: 12)).foregroundColor(.gray.opacity(0.6))
            }
            
            Spacer()
            
            Image(systemName: "ellipsis").padding()
                .rotationEffect(.degrees(90))
        }.frame(width:UIScreen.main.bounds.width)
    }
    
    var actionButtons: some View {
        HStack {
            Image(self.liked ? "fill_heart" : "heart")
                .resizable()
                .frame(width: 24, height: 24)
                .aspectRatio( contentMode: .fill)
               // .foregroundColor(self.liked ? .red : Color(.label))
                .onTapGesture {
                    self.liked.toggle()
                    self.likedcallback(self.liked)
                }
                .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 2))
            
            Image("comment")
                .aspectRatio( contentMode: .fill)
                .padding(.init(top: 0, leading: 5, bottom: 0, trailing: 2))
            
            Image("share")
                .padding(.init(top: 0, leading: 5, bottom: 0, trailing: 2))
            
            Spacer()
            
            Image(self.saveFeed ? "bookmark" : "bookmark")
                .padding(.init(top: 0, leading: 8, bottom: 0, trailing: 8))
                .onTapGesture {
                    self.saveFeed.toggle()
                }
            
        }
        .font(.system(size: 21, weight: .light))
        .padding([.top])
        .fixedSize(horizontal: false, vertical: true)
    }
    
    var textContent: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("322 likes")
            
                .font(.system(size: 14)).bold()
                .padding([.leading, .trailing])
                .frame(maxWidth: .infinity, alignment: .leading)
            Group {
                Text("\(post.username) ").font(.system(size: 14)).bold() +
                Text(post.caption).font(.system(size: 14))
            }
            .padding([.leading, .trailing])
            
            Text("41 minutes ago")
                .foregroundColor(Color(.systemGray2))
                .font(.system(size: 14))
                .padding([.leading, .trailing])
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    var body: some View {
        VStack {
            header
            
            
            AsyncImage(url: URL(string: post.imageurl)!,
                       placeholder: { ProgressView() },
                       image: { Image(uiImage: $0)
                    .resizable()
                
            })
                .frame(width:UIScreen.main.bounds.width, height: 250, alignment: .center) // 2:3 aspect ratio
                .aspectRatio( contentMode: .fill)
                .background(.gray.opacity(0.2))
            
            actionButtons
            
            textContent
            
            Spacer()
        }.background(.clear)
            .listRowSeparator(.hidden)
    }
}
