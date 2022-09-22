//
//  LoginView.swift
//  InstagramUI
//
//  Created by Admin on 19/09/22.
//

import SwiftUI

struct LoginView: View {
    
    
    @State var emailID:String = ""
    @State var password:String = ""
    @ObservedObject var viewModel = LoginViewModel()
    @State private var showShareSheet = false
    var line: some View {
        VStack { Divider().background(.gray) }.padding()
    }
    
    var body: some View {
        
        NavigationView{
            VStack{
                //Header top
                HStack(spacing: 12){
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Image(uiImage: UIImage.init(named: "close")!)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.primary)
                            
                        }
                        
                        
                    }.padding([.horizontal,.top])
                    
                }
                Spacer()
                
                
                VStack(spacing: 15){
                    Image(uiImage: UIImage.init(named: "Instagram_logo")!)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 180, alignment: .leading)
                        .foregroundColor(.primary)
                    
                    TextField("Phone Number,username or email", text:$emailID)
                        .frame(height: 25)
                        .padding(8)
                        .background(.gray.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                        .font(.system(size: 14))
                        .accessibilityIdentifier("email_textfield")
                    
                    SecureField("Password", text: $password)
                        .frame(height: 25)
                        .padding(8)
                        .background(.gray.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                        .font(.system(size: 14))
                        .accessibilityIdentifier("password_textfield")
                    
                    Button(action: {}) {
                        Text("Forgot Password?")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                    }.frame(maxWidth: .infinity,maxHeight: 45,alignment: .trailing)
                        .foregroundColor(Color.white)
                        .background(Color.clear)
                        .cornerRadius(8)
                    
                    
                    
                    Button(action: {
                        
                        viewModel.credentials = UserLoginModel.init(email: emailID, password:  password)
                        viewModel.loginApi()
                        
                    }) {
                        Text("Login")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                        
                        
                    }.frame(maxWidth: .infinity,maxHeight: 45)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .accessibilityIdentifier("loginButton")
                    
                    
                    HStack{
                        line
                        Text("OR")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .foregroundColor(.gray.opacity(0.5))
                        line
                    }
                    
                    HStack{
                        Button(action: {}) {
                            Text("Continue as it_ur_bhuvi.")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                            
                        }
                        .foregroundColor(Color.blue)
                        .background(Color.clear)
                        
                        
                    }.frame(alignment: .bottom)
                    
                    
                }.padding(25)
                
                NavigationLink(destination: TabbarView(), isActive: $viewModel.isLogin) {
                    EmptyView()
                }.hidden()
                
                Spacer()
                HStack{
                    Text("Don't have an account?")
                        .font(.system(size: 15))
                    
                    Button(action: {
                        
                        showShareSheet = true
                    }) {
                        Text("Signup.")
                            .font(.system(size: 15))
                        
                        
                    }
                    .foregroundColor(Color.blue)
                    .background(Color.clear)
                    
                    
                }.frame(alignment: .bottom)
            }.sheet(isPresented: $showShareSheet) {
                ShareSheet(activityItems: ["Hello World"])
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .overlay(overlayView: Banner.init(data: Banner.BannerDataModel(title: "Login", detail: viewModel.errorMessage?.message ?? "", type: .error), show:$viewModel.isToast)
                     , show: $viewModel.isToast)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct ShareSheet: UIViewControllerRepresentable {
    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    let callback: Callback? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // nothing to do here
    }
}
