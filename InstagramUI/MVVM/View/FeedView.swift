//
//  FeedView.swift
//  InstagramUI
//
//  Created by Admin on 30/08/22.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State var isToast = false
    var body: some View {
        VStack{
            HStack(spacing: 10){
                
                Image(uiImage: UIImage.init(named: "Instagram_logo")!)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 180, height: 46, alignment: .leading)
                
                
                Spacer(minLength: 0)
                Button(action: {}) {
                    Image("add")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .aspectRatio( contentMode: .fit)
                        .foregroundColor(.primary)
                    
                }
                Button(action: {}) {
                    Image("messenger")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .aspectRatio( contentMode: .fit)
                        .foregroundColor(.primary)
                    
                }
                
                
            }.padding([.horizontal,.top])
            
            List(){
                Section() {
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack{
                            Spacer(minLength: 10)
                            ForEach(0 ..< (self.viewModel.hightlights?.count ?? 0)) { value in
                                Button(action: {
                                    
                                    
                                }) {
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
                        }
                    }.listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .listRowSeparator(.hidden)
                    
                }
                Section() {
                    ForEach(viewModel.feedlist ?? []) { feed in
                        
                        PostCell(post: feed, likedcallback: { status in
                            isToast = true
                        })
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                    }
                }
                
            }.background(Colors.theme1.contentDefaultColor)
                .frame(width: UIScreen.main.bounds.width)
                .listStyle(PlainListStyle())
        }.background(Colors.theme1.contentDefaultColor)
            .overlay(overlayView: Banner.init(data: Banner.BannerDataModel(title: "Instagram post", detail: "You have clicked on Liked", type: .info), show: $isToast)
                     , show: $isToast)
        
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
