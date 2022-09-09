//
//  EditProfileView.swift
//  InstagramUI
//
//  Created by Admin on 26/08/22.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.presentationMode) var presentation
    var userprofile: Userprofile
    
    @State var name:String = ""
    @State var username:String =  ""
    @State var website:String = ""
    @State var bio:String =  ""
    @State private var tabBar: UITabBar! = nil
    
    
    fileprivate func ChoosePhoto() -> some View {
        HStack{
            
            VStack{
                Image(uiImage: UIImage.init(named: "avtar")!)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .cornerRadius(45)
                    .foregroundColor(.primary)
                
                Button(action: {
                    
                }) {
                    Text("Change Profile")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.blue)
                    
                }
                
            }
            
            
        }
    }
    
    var body: some View {
        
        VStack{
            //Header top
            HStack(spacing: 12){
                
                HStack{
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Image(uiImage: UIImage.init(named: "close")!)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.primary)
                        
                    }
                    
                    Text("Edit Profile")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Image(uiImage: UIImage.init(named: "tick")!)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.blue)
                        
                    }
                }.padding([.horizontal,.top])
                
                
            }
            
            //Scroll Outside wrapper
            ScrollView(.vertical, showsIndicators: false) {
                Spacer(minLength: 0)
                VStack{
                    
                    ChoosePhoto()
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("Name")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .frame(alignment: .leading)
                        TextField("", text: $name)
                            .font(.system(size: 14))
                        Divider()
                    }.padding(5)
                    VStack(alignment: .leading, spacing: 5){
                        Text("Username")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .frame(alignment: .leading)
                        TextField("", text: $username)
                            .font(.system(size: 14))
                        Divider()
                    }.padding(5)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("Website")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .frame(alignment: .leading)
                        TextField("", text: $website)
                            .font(.system(size: 14))
                        Divider()
                    }.padding(5)
                    
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("Bio")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .frame(alignment: .leading)
                        TextEditor(text: $bio)
                            .textFieldStyle(PlainTextFieldStyle())
                            .background(Color.clear)
                            .font(.system(size: 14))
                            .frame(height:100)      // << !!
                            .autocapitalization(.words)
                            .disableAutocorrection(true)
                        
                        Divider()
                    }.padding(5)
                    
                    
                    HStack{ Text("Business Infomation")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                            .frame(alignment: .leading)
                            .padding()
                        
                        Spacer()
                    }
                    
                    HStack{
                        Text("Page")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                            .frame(alignment: .leading)
                        Spacer()
                        Text("Its_ur_bhuvi")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .frame(alignment: .trailing)
                        
                    }.padding([.bottom,.leading])
                    
                    
                    HStack{
                        Text("Category")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                            .frame(alignment: .leading)
                        Spacer()
                        Text("Digital content creator")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .frame(alignment: .trailing)
                        
                    }.padding([.bottom,.leading])
                    
                    HStack{
                        Text("Contact Option")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                            .frame(alignment: .leading)
                        Spacer()
                        Text("Email")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .frame(alignment: .trailing)
                        
                    }.padding([.bottom,.leading])
                    
                    
                    
                }.padding()
            }
            
        }
        
        .background(Colors.theme1.contentDefaultColor)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear {
            name = userprofile.fullname ?? ""
            username = userprofile.username ?? ""
            website = userprofile.link ?? ""
            bio = userprofile.bio ?? ""
            
            // TabbarView.shared.hidetabbar = true
        }.onDisappear {
            // TabbarView.shared.hidetabbar = false
        }
        
        
        
    }
}
