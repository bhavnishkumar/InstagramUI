//
//  FeedViewModel.swift
//  InstagramUI
//
//  Created by Admin on 30/08/22.
//

import Foundation
import SwiftUI

class FeedViewModel:ObservableObject {
    
    @Published var feedlist: [Feed]?
    @Published var hightlights: [Hightlight]?
    
    init(){
        loadData()
    }
    
    
    ///MARK:- read local json file store data in userprofile object
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Feed", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let responseData = try JSONDecoder().decode(FeedModel.self, from: data)
            self.feedlist = responseData.feed
            self.hightlights = responseData.hightlights
        } catch let error {
            print(error.localizedDescription)
        }
    }
}


