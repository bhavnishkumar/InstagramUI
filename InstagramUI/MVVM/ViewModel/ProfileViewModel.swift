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
    var menuList:[MenuModel] = [
        MenuModel.init(id: 1, menuIMG: "video.badge.plus", menuName: "Reel"),
        MenuModel.init(id: 2, menuIMG: "photo", menuName: "Post"),
        MenuModel.init(id: 3, menuIMG: "pencil.circle", menuName: "Story"),
        MenuModel.init(id: 4, menuIMG: "play.rectangle.fill", menuName: "Story Hightlight"),
        MenuModel.init(id: 5, menuIMG: "pencil.circle", menuName: "Live"),
        MenuModel.init(id: 6, menuIMG: "questionmark.circle.fill", menuName: "Guide")
    ]
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


