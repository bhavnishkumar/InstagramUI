//
//  TabbarView.swift
//  InstagramUI
//
//  Created by Admin on 31/08/22.
//

import SwiftUI

struct TabbarView: View {
    @State var selection: Int = 0
    
    var body: some View {
        
        // Your native TabView here
        TabView(selection: $selection) {
            FeedView()
                .tag(0)
            
            SearchView()
                .tag(1)
            
            ReelsView()
                .tag(2)
            
            NotificationView()
                .tag(3)
            
            ProfileView()
                .tag(4)
        }
        .overlay( // Overlay the custom TabView component here
            Color.white // Base color for Tab Bar
                .edgesIgnoringSafeArea(.vertical)
                .frame(height: 50) // Match Height of native bar
                .overlay(HStack {
                    
                    
                    TabbarItems(image: "home", isSystemImage: false, index: 0, selectedTabIndex: $selection, action: {
                        self.selection = 0
                    })
                    Spacer()
                    TabbarItems(image: "search", isSystemImage: false, index: 1, selectedTabIndex: $selection, action: {
                        self.selection = 1
                    })
                    
                    Spacer()
                    TabbarItems(image: "video", isSystemImage: false, index: 2, selectedTabIndex: $selection, action: {
                        self.selection = 2
                    })
                    
                    Spacer()
                    TabbarItems(image: "heart", isSystemImage: true, index: 3, selectedTabIndex: $selection, action: {
                        self.selection = 3
                    })
                    Spacer()
                    TabbarItems(image: "user", isSystemImage: false, index: 4, selectedTabIndex: $selection, action: {
                        self.selection = 4
                    })
                }.padding())
            ,alignment: .bottom) 
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}


//Tabbar View Designable
struct TabbarItems:View{
    
    var image:String
    var isSystemImage:Bool
    var index:Int
    @Binding var selectedTabIndex:Int
    var action: (() -> Void)?
    var body: some View{
        Button(action: {
            selectedTabIndex = index
            action?()
        }) {
            VStack(spacing:15){
                (
                    isSystemImage ? Image(systemName: image) : Image(image)
                ).renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22,alignment: .center)
                    .foregroundColor(.primary)
                   // .opacity(selectedTabIndex == index ? 1 : 0.4)
                
            }
        }
        
    }
}
