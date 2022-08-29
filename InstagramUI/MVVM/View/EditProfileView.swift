//
//  EditProfileView.swift
//  InstagramUI
//
//  Created by Admin on 26/08/22.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
       
            VStack{
                //Header top
                HStack(spacing: 12){
                    
                    HStack{
                        Button(action: {
                            self.presentation.wrappedValue.dismiss()
                        }) {
                            Image(uiImage: UIImage.init(named: "close")!)
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
                                .foregroundColor(.blue)
                          
                        }
                    }.padding([.horizontal,.top])
                    
                    
                }
                Spacer(minLength: 0)
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
