//
//  ContentView.swift
//  InstagramUI
//
//  Created by Admin on 09/08/22.
//

import SwiftUI


struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    @State var selectedTab:Int = 0 //selected tab
    @Namespace var animation
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var index: Int = 0
    @State private var offset: CGFloat = 0
    @State private var stickyHeaderOffset: CGFloat = 0
    @State var isEditProfile:Bool = false
    @State private var tabBar: UITabBar! = nil
    @State var isToast = false
    
    //MARK:- Dynamics Buttons Profile
    fileprivate func DyanmicsButtons() -> some View {
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
                
                Button(action: {
                    self.isEditProfile =  !self.isEditProfile
                }) {
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
    
    ///MARK:- Hightlights
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
    
    //MARK:- Dropdown Menu list
    fileprivate func dropdownMenu() -> some View {
        Menu {
            ForEach(self.viewModel.menuList) { menu in
                Button(action: {
                    
                }) {
                    Label(menu.menuName, systemImage: menu.menuIMG)
                }
            }
        } label: {
            Image(systemName: "plus.app")
                .font(.title)
                .foregroundColor(.primary)
        }
    }
    
    //MARK:- Bio information list
    fileprivate func BioInformation() -> some View {
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
    }
    
    fileprivate func HeaderView() -> some View {
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
            
            dropdownMenu() //dropdown menu
            
            Button(action: {}) {
                Image(uiImage: UIImage.init(named: "hamburger")!)
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                
                
                
            }
        }.padding([.horizontal,.top])
    }
    
    fileprivate func profileinfo() -> some View {
        //Avatar and posts follower and following section
        HStack(spacing: 2){
            Button(action: {}) {
                Image(uiImage: UIImage.init(named: "avtar")!)
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
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Posts")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                }.frame(maxWidth: .infinity)
                
                VStack{
                    Text((self.viewModel.userprofile?.followers ?? "0"))
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Followers")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                }.frame(maxWidth: .infinity)
                
                VStack{
                    Text((self.viewModel.userprofile?.following ?? "0"))
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Following")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                }.frame(maxWidth: .infinity)
            }
            
        }.padding(.horizontal)
    }
    
    fileprivate func Grids() -> some View {
        /// Grid
        TabView(selection: $selectedTab) {
            
            //LazyVGrid 1
            LazyVGrid(columns:  [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 5) {
                
                ForEach(1...15 ,id: \.self){index in
                    GeometryReader{proxy in
                        
                        //   let width = proxy.frame(in: .global).width
                        let image =  "post\(index)"
                        
                        Button {
                            self.isToast = true
                        } label: {
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (width / 3), height:  (width / 3) )
                                .cornerRadius(4)
                        }
                    }.frame(height: (width / 3) )
                    
                }
                
            }.padding(8)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .tag(0)
            
            //LazyVGrid 2
            LazyVGrid(columns:  [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 5) {
                
                
                ForEach(1...15 ,id: \.self){index in
                    
                    GeometryReader{proxy in
                        
                        //  let width = proxy.frame(in: .global).width
                        let image =  "post\(index)"
                        Button {
                            self.isToast = true
                        } label: {
                            
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (width / 3), height: (width / 3) + 40)
                                .cornerRadius(4)
                            
                        }
                    }.frame(height: (width / 3) + 40)
                }
                
            }.padding(8)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .tag(1)
            
            //LazyVGrid 3
            LazyVGrid(columns:  [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 5) {
                
                
                ForEach(1...15 ,id: \.self){index in
                    
                    GeometryReader{proxy in
                        
                        //   let width = proxy.frame(in: .global).width
                        let image =  "post\(index)"
                        
                        Button {
                            self.isToast = true
                        } label: {
                            
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width:  (width / 3), height:   (width / 3) )
                                .cornerRadius(4)
                        }
                        
                        
                    }.frame(height:  (width / 3))
                }
                
            }.padding(8)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .tag(2)
            
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .frame(height: selectedTab != 1 ?  ((width / 3) * 5) + 20  :  (((width / 3) + 40) * 5) + 20)
    }
    
    
    
    var body: some View {
        //  NavigationView {
        VStack{
            HeaderView()
            GeometryReader{proxy -> Color in
                let minY = proxy.frame(in: .global).minY
                print("minY:\(minY)")
                DispatchQueue.main.async {
                    if stickyHeaderOffset == 0{
                        stickyHeaderOffset = minY
                    }
                }
                return Color.clear
                
            }.frame(width: 0, height: 0)
            //Scroll Outside wrapper
            ScrollView(.vertical, showsIndicators: false) {
                
                profileinfo()
                
                BioInformation()
                
                DyanmicsButtons()
                
                highlights() //Highlights
                
                //header tabbar with sticky
                GeometryReader{proxy -> AnyView in
                    let minY = proxy.frame(in: .global).minY
                    print("minY:\(minY)")
                    
                    //                    print("stickyHeaderOffset:\(stickyHeaderOffset)")
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
                            .padding(0)
                            .background(Colors.backrground.contentDefaultColor)
                        //   .offset(y: offset < 0 ? -offset : 0)
                    )
                    
                }.frame( height: 45)
                //  .zIndex(4)
                
                Grids()
                
            }
            
            
            NavigationLink(destination: EditProfileView( userprofile: self.viewModel.userprofile!)
                    
                           , isActive: self.$isEditProfile) {
                EmptyView()
            }.hidden()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .background(Colors.theme1.contentDefaultColor)
        .overlay(overlayView: Banner.init(data: Banner.BannerDataModel(title: "Instagram", detail: "You have clicked on Item", type: .info), show: $isToast)
                 , show: $isToast)
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
