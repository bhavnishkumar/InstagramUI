//
//  EditProfileView.swift
//  InstagramUI
//
//  Created by Admin on 26/08/22.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.presentationMode) var presentation
    @State var name:String = "Bhavnish"
    @State var username:String = "its_ur_bhuvi"
    @State var website:String = "https://github.com/bhavnishkumar"
    @State var bio:String = "🙋🏻‍♂️ Turning ideas into apps since 2019\n💸 Vision: live free \n⚒ Follow the journey \n👨🏻‍💻#iosdev #iosdev #coding"
   
    
    fileprivate func ChoosePhoto() -> some View {
        HStack{
            
            VStack{
                Image(uiImage: UIImage.init(named: "Avatar+white")!)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(40)
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
                    
                    
                    Text("Business Infomation")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .frame(alignment: .leading)
                        .padding()
                    
                    
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
                        
                    }.padding(.bottom)
                    
                    
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
                        
                    }.padding(.bottom)
                    
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
                        
                    }.padding(.bottom)
                    
                    
                    
                }.padding()
            }
            
        }.background(Colors.theme1.contentDefaultColor)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        
    }
}
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
