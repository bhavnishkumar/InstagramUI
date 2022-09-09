//
//  SearchView.swift
//  InstagramUI
//
//  Created by Admin on 31/08/22.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        VStack{
            HStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .font(.title3)
                        .foregroundColor(.gray)
                    TextField( "Search", text: $viewModel.search)
                    
                }.padding(.vertical,10)
                    .padding(.horizontal)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(8)
            }.padding(10)
        
        if viewModel.cards.isEmpty{
            ProgressView().frame(maxWidth: .infinity, maxHeight: .infinity)
        }else{
            ScrollView{
                VStack(spacing: 4){
                    ForEach(viewModel.compositionalArray.indices,id: \.self){ index in
                       
                        
                        if index == 0 || index % 6 == 0 {
                            Layout1(cards: viewModel.compositionalArray[index])
                        }else if index % 3 == 0{
                            Layout3(cards: viewModel.compositionalArray[index])
                        }else{
                            Layout2(cards: viewModel.compositionalArray[index])
                        }
                      
                    }
                  
                }.padding(.horizontal)
            }.padding()
        }
            
        }.navigationTitle("")
            .navigationBarHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
