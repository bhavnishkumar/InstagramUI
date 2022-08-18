//
//  ContentView.swift
//  InstagramUI
//
//  Created by Admin on 09/08/22.
//

import SwiftUI

struct InnerContentSize: PreferenceKey {
    typealias Value = [CGRect]
    
    static var defaultValue: [CGRect] = []
    static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
        value.append(contentsOf: nextValue())
    }
}

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    @State var selectedTab:Int = 0 //selected tab
    @Namespace var animation
    let posts = ["bed.double.fill","tram.fill","tv.music.note.fill","hare.fill"]
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var index: Int = 0
    @State private var offset: CGFloat = 0
    @State private var stickyHeaderOffset: CGFloat = 0
    
    
    
    
    fileprivate func dyanmicsButtons() -> some View {
        HStack{
            if self.viewModel.userprofile?.isOtherProfile ?? false {
                //Other profile
                Button(action: {
                    viewModel.userprofile?.isFollow = !(viewModel.userprofile?.isFollow ?? false)
                }) {
                    Text( (self.viewModel.userprofile?.isFollow ?? false) ? "Following" : "Follow" )
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                }.frame(maxWidth: .infinity,maxHeight: 40)
                    .foregroundColor((self.viewModel.userprofile?.isFollow ?? false) ? .black : .white)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .background((self.viewModel.userprofile?.isFollow ?? false) ?  Color.gray.opacity(0.2) :  .blue )
                    .cornerRadius(8)
                    .animation(.easeInOut(duration: 1))
                
                Button(action: {}) {
                    Text("Message")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                    
                }.frame(maxWidth: .infinity,maxHeight: 40)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus")
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
            }else{
                
                Button(action: {}) {
                    Text("Edit Profile")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                }.frame(maxWidth: .infinity,maxHeight: 40)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus")
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            
            
        }.padding(.horizontal)
    }
    
    ///Hightlights
    fileprivate func highlights() -> some View{
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack{
                ForEach(0 ..< (self.viewModel.userprofile?.hightlights?.count ?? 0)) { value in
                    Button(action: {}) {
                        VStack{
                            Image(uiImage: UIImage.init(named:self.viewModel.userprofile?.hightlights?[value].hightlightImg ?? "")!)
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .cornerRadius(30)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                                )
                            Text(self.viewModel.userprofile?.hightlights?[value].hightlightText ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 10))
                                .fontWeight(.regular)
                        }
                    }.padding(2)
                }
            }.padding()
        }
    }
    
    var body: some View {
        VStack{
            
            //Header top
            HStack(spacing: 12){
                Button(action: {}) {
                    HStack{
                        Text(viewModel.userprofile?.username ?? "")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Image(uiImage: UIImage.init(named: "bluetick")!)
                        
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(width: 20, height: 20, alignment: .leading)
                            .opacity((viewModel.userprofile?.bluetickEnable ?? false) ? 1 : 0)
                        
                        
                    }
                }
                Spacer(minLength: 0)
                //                Button(action: {}) {
                //                    Image(systemName: "plus.app")
                //                        .font(.title)
                //                        .foregroundColor(.primary)
                //                }
                
                //Add Popup Over Menu
                Menu {
                    Button(action: {
                        
                    }) {
                        Label("Reel", systemImage: "folder.badge.plus")
                    }
                    Button(action: {
                        
                    }) {
                        Label("Post", systemImage: "checkmark.circle")
                    }
                    Button(action: {
                        
                    }) {
                        Label("Story", systemImage: "pencil.circle")
                    }
                    Button(action: {
                        
                    }) {
                        Label("Story Hightlight", systemImage: "pencil.circle")
                    }
                    Button(action: {
                        
                    }) {
                        Label("Live", systemImage: "pencil.circle")
                    }
                    
                    Button(action: {
                        
                    }) {
                        Label("Guide", systemImage: "pencil.circle")
                    }
                    
                    
                } label: {
                    Image(systemName: "plus.app")
                        .font(.title)
                        .foregroundColor(.primary)
                }
                
                
                Button(action: {}) {
                    Image(uiImage: UIImage.init(named: "hamburger")!)
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                    
                    
                    
                }
            }.padding([.horizontal,.top])
            
            
            //            Spacer(minLength: 0)
            Divider().padding(.top)
            
            
            GeometryReader{proxy -> Color in
                let minY = proxy.frame(in: .global).minY
                DispatchQueue.main.async {
                    if stickyHeaderOffset == 0{
                        stickyHeaderOffset = minY
                    }
                }
                return Color.clear
                
            }.frame(width: 0, height: 0)
            
            
            
            //Scroll Outside wrapper
            ScrollView(.vertical, showsIndicators: false) {
                
                //Avatar and posts follower and following section
                HStack(spacing: 2){
                    Button(action: {}) {
                        Image(uiImage: UIImage.init(named: "Avatar+white")!)
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .cornerRadius(40)
                            .shadow(radius: 2)
                    }
                    
                    Spacer(minLength: 30)
                    HStack{
                        VStack{
                            Text((self.viewModel.userprofile?.posts ?? "0"))
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("Posts")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                            
                        }.frame(maxWidth: .infinity)
                        
                        VStack{
                            Text((self.viewModel.userprofile?.followers ?? "0"))
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("Followers")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                            
                        }.frame(maxWidth: .infinity)
                        
                        VStack{
                            Text((self.viewModel.userprofile?.following ?? "0"))
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("Following")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                            
                        }.frame(maxWidth: .infinity)
                    }
                    
                }.padding(.horizontal)
                
                
                //Bio information section
                VStack(alignment: .leading, spacing: 2){
                    HStack {
                        Spacer()
                    }
                    Text(self.viewModel.userprofile?.fullname ?? "")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    
                    Text(self.viewModel.userprofile?.caption ?? "")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    
                    
                    
                    Text(self.viewModel.userprofile?.bio ?? "")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    Link(destination: URL(string: self.viewModel.userprofile?.link ?? "")!) {
                        Text(self.viewModel.userprofile?.link ?? "")
                            .font(.system(size: 14))
                    }
                    
                }.padding(.horizontal)
                
                dyanmicsButtons()
                
                highlights() //Highlights
                
                //header tabbar with sticky
                GeometryReader{proxy -> AnyView in
                    let minY = proxy.frame(in: .global).minY
                    print("stickyHeaderOffset:\(stickyHeaderOffset)")
                    let offset =   minY - stickyHeaderOffset
                    print("offset:\(offset)")
                    return AnyView(
                        HStack(spacing:0){
                            
                            TabbarButton(image: "pixels", isSystemImage: false, animatation: animation,index: 0,selectedTabIndex: $selectedTab) {
                                selectedTab = 0
                            }
                            TabbarButton(image: "video", isSystemImage: false, animatation: animation,index: 1,selectedTabIndex: $selectedTab) {
                                selectedTab = 1
                            }
                            TabbarButton(image: "person.crop.square", isSystemImage: true, animatation: animation,index:2,selectedTabIndex: $selectedTab) {
                                selectedTab = 2
                            }
                            
                        }.frame( height: 45,alignment: .bottom)
                            .background(Colors.backrground.contentDefaultColor)
                            .offset(y: offset < 0 ? -offset : 0)
                    )
                    
                }.frame( height: 45)
                    .zIndex(4)
                
                
                
                //                VStack{
                //                    LazyVGrid(columns:  [
                //                        GridItem(.flexible()),
                //                        GridItem(.flexible()),
                //                        GridItem(.flexible())
                //                    ], spacing: 5) {
                //
                //
                //                        ForEach(1...15 ,id: \.self){index in
                //
                //                            GeometryReader{proxy in
                //
                //                                let width = proxy.frame(in: .global).width
                //                                let image =  "post\(index)"
                //                                Image(image)
                //                                    .resizable()
                //                                    .aspectRatio(contentMode: .fill)
                //                                    .frame(width: width, height: selectedTab != 1 ? width : 180)
                //                                    .cornerRadius(3)
                //
                //
                //                            }.frame(height: selectedTab != 1 ? 120 : 180)
                //
                //
                //
                //                        }
                //
                //                    }.padding(8)
                //                    .frame(width: UIScreen.main.bounds.width)
                //
                //                }
                //
                
                TabView(selection: $selectedTab) {
                    
                    VStack{
                        LazyVGrid(columns:  [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 5) {
                            
                            ForEach(1...15 ,id: \.self){index in
                                GeometryReader{proxy in
                                    
                                    let width = proxy.frame(in: .global).width
                                    let image =  "post\(index)"
                                    Image(image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: width, height:  width )
                                        .cornerRadius(3)
                                    
                                    
                                }.frame(height: 120 )
                            }
                            
                        }.padding(8)
                    }.tag(0)
                    
                    VStack{
                        LazyVGrid(columns:  [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 5) {
                            
                            
                            ForEach(1...15 ,id: \.self){index in
                                
                                GeometryReader{proxy in
                                    
                                    let width = proxy.frame(in: .global).width
                                    let image =  "post\(index)"
                                    Image(image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: width, height: 180)
                                        .cornerRadius(3)
                                    
                                    
                                }.frame(height: 180)
                            }
                            
                        }.padding(8)
                        
                        
                    }.tag(1)
                    
                    VStack{
                        LazyVGrid(columns:  [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 5) {
                            
                            
                            ForEach(1...15 ,id: \.self){index in
                                
                                GeometryReader{proxy in
                                    
                                    let width = proxy.frame(in: .global).width
                                    let image =  "post\(index)"
                                    Image(image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: width, height:  width )
                                        .cornerRadius(3)
                                    
                                    
                                }.frame(height: 120)
                            }
                            
                        }.padding(8)
                    }.tag(2)
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .frame(height: 600)
                
            }
        }
        .background(Colors.theme1.contentDefaultColor)
    }
    
}



extension Int {
    func keepIndexInRange(min: Int, max: Int) -> Int {
        switch self {
        case ..<min: return min
        case max...: return max
        default: return self
        }
    }
}



//Tabbar View Designable
struct TabbarButton:View{
    
    var image:String
    var isSystemImage:Bool
    var animatation:Namespace.ID
    var index:Int
    @Binding var selectedTabIndex:Int
    var action: (() -> Void)?
    var body: some View{
        Button(action: {
            
            selectedTabIndex = index
            action?()
        }) {
            VStack(spacing:12){
                (
                    isSystemImage ? Image(systemName: image) : Image(image)
                ).renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(selectedTabIndex == index ? .primary : .gray)
                ZStack{
                    if selectedTabIndex == index{
                        Rectangle()
                            .fill(Color.primary)
                    }else{
                        Rectangle()
                            .fill(Color.clear)
                    }
                }.frame( height: 1)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

