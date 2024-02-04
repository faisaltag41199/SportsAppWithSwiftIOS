//
//  LeaguesViewModel.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 01/02/2024.
//

import Foundation

class LeaguesViewModel{
    
    var apiManager:(any APIManager)?
    var bindResultToViewController :()->Void = {}
    var url:String?
    
    var leagues : [LeagueModel]? {
        didSet{
            bindResultToViewController()
        }
    }
    
    init(apiManager: (any APIManager)?,url:String) {
        self.apiManager = apiManager
        self.url = url
    }
    
    func loadData(){
        
        apiManager?.fetchData(handler: { result, errorStatus in
            
            guard let resultLeagues = (result as? LeaguesModel)?.leagues
            else{
                print(errorStatus?.errorDescription ?? "no data")
                return
            }
            
            self.leagues = resultLeagues
            
        }, url: self.url ?? "")
        
    }

    func getData()->[LeagueModel]{
        
        return leagues ?? []
    }

}
