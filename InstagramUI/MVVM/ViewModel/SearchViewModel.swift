//
//  SearchViewModel.swift
//  InstagramUI
//
//  Created by Admin on 08/09/22.
//

import Foundation

class SearchViewModel:ObservableObject{
    
    @Published var cards: [Card] = []
    
    @Published var search: String = ""
    
    @Published var compositionalArray: [[Card]] = []
    
    init(){
        loadData()
    }
    
    
    ///MARK:- read local json file store data in userprofile object
    func loadData()  {
        let url = "https://picsum.photos/v2/list?page=2&limit=60"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL.init(string: url)!) { data, response, error in
            if error != nil{
                print(error?.localizedDescription ?? "")
            }
            guard let json = data else{return}
            
            let jsonValue = try? JSONDecoder().decode([Card].self, from: json)
            guard let cards = jsonValue else{return}
            DispatchQueue.main.async {
                self.cards =  cards
                self.setCompositionalLayout()
            }  
            
        }.resume()
    }
    
    //MARK- Compostional array setup
    func setCompositionalLayout(){
        var compositionalArr : [Card] = []
        cards.forEach { card in
            compositionalArr.append(card)
            if compositionalArray.count % 2 == 0 ||  compositionalArray.count % 3 == 0{
                if compositionalArr.count == 5{
                    
                    print("index :\(compositionalArray.count)")
                    print("elements :\(compositionalArr.count)")
                    compositionalArray.append(compositionalArr)
                    compositionalArr.removeAll()
                    
                }
                
            }else{
                if compositionalArr.count == 3{
                    print("index :\(compositionalArray.count)")
                    print("elements :\(compositionalArr.count)")
                    compositionalArray.append(compositionalArr)
                    compositionalArr.removeAll()
                    
                } 
            }
        }
        
    }
    
}
