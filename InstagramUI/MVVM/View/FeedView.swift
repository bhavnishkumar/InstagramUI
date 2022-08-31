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
    var body: some View {
        NavigationView{
            VStack{
                HStack(spacing: 12){
                    Button(action: {}) {
                        HStack{
                            Image(uiImage: UIImage.init(named: "Instagram_logo")!)
                            
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 220, height: 50, alignment: .leading)
                            
                        }
                    }
                    Spacer(minLength: 0)
                    Button(action: {}) {
                        Image(uiImage: UIImage.init(systemName: "plus.app")!)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .leading)
                            .foregroundColor(.primary)
                        
                    }
                    Button(action: {}) {
                        Image(uiImage: UIImage.init(named: "messanger")!)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .leading)
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
                                                .frame(width: 65, height: 65)
                                                .clipShape(Circle())
                                                .cornerRadius(32.5)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 32.5)
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
                            PostCell(post: feed)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                    }
                   
                }.background(Colors.theme1.contentDefaultColor)
                .frame(width: UIScreen.main.bounds.width)
                    .listStyle(PlainListStyle())
            }.background(Colors.theme1.contentDefaultColor)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
