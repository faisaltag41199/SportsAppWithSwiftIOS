//
//  TeamsViewModel.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 01/02/2024.
//

import Foundation

class TeamsViewModel{
   
    
    var apiManager:(any APIManager)?
    var bindTeamsResultToViewController :()->Void = {}
    var url:String?
    
    var teams:[TeamModel]? {
        didSet{
            bindTeamsResultToViewController()
        }
    }
    
    init(apiManager: (any APIManager)? = nil, url: String? = nil) {
        self.apiManager = apiManager
        self.url = url
    }
    
    func loadData(){
        
        apiManager?.fetchData(handler: { result, errorStatus in
            
            guard let resultTeams = (result as? TeamsModel)?.teams
            else{
                print(errorStatus?.errorDescription ?? "no data")
                return
            }
            
            self.teams = resultTeams

        }, url: url ?? "")
        
        
    }
    
    func getData()->[TeamModel]{
        return teams ?? []
    }
    
    
    
}
