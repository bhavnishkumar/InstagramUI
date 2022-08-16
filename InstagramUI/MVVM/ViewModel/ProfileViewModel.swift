//
//  ProfileViewModel.swift
//  InstagramUI
//
//  Created by Admin on 10/08/22.
//

import Foundation
import SwiftUI

class ProfileViewModel:ObservableObject {
    
    @Published var userprofile: Userprofile?
    
    init(){
        loadData()
    }

    ///MARK:- read local json file store data in userprofile object
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Userdata", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let users = try JSONDecoder().decode(ProfileModel.self, from: data)
            self.userprofile = users.userprofile
        } catch let error {
            print(error.localizedDescription)
        }
    }
}


