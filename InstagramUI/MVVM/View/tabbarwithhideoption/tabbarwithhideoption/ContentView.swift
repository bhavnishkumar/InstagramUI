//
//  ContentView.swift
//  tabbarwithhideoption
//
//  Created by Admin on 02/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct FirstView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("First View")
                    .font(.headline)
            }
            .navigationTitle("First title")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.yellow)
        }
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: ThirdView()) {
                Text("Second View, tap to navigate")
                    .font(.headline)
            }
        }
        .navigationTitle("Second title")
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.orange)
    }
}

struct ThirdView: View {
    var body: some View {
        VStack {
            Text("Third View with tabBar hidden")
                .font(.headline)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.red.edgesIgnoringSafeArea(.bottom))
    }
}
