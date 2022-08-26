//
//  SpalshView.swift
//  InstagramUI
//
//  Created by Admin on 26/08/22.
//

import SwiftUI

struct SpalshView: View {
    @State var isActive:Bool = false
    var body: some View {
        if self.isActive {
            ProfileView()
        } else {
            VStack{
                GeometryReader { gp in
                    ZStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
                            .position(x: gp.size.width / 2, y: gp.size.height / 2)
                        
                    }
                }
                
                VStack{
                    Text("from")
                    Image("meta")
                        .resizable()
                        .frame(width: 100, height: 30)
                    
                    
                }.frame(alignment: .bottom)
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
            
        }
        
        
    }
}

struct SpalshView_Previews: PreviewProvider {
    static var previews: some View {
        SpalshView()
    }
}
