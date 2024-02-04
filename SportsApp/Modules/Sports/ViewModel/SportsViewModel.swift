//
//  SportsViewModel.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 28/01/2024.
//

import Foundation


protocol SportsViewModel{
    
    func getSports()->[Sport]
}

class SportsViewModelImplementation : SportsViewModel{
    
    private var sports:[Sport] = []
    
    func getSports()->[Sport]{
        
        let football = Sport(sportName: AppSportsStrings.footballSportName ,sportImage: AppSportsStrings.footballSportImage)
        
        let basketball = Sport(sportName:AppSportsStrings.basketballSportName,sportImage: AppSportsStrings.basketballSportImage)
        
        let tennis = Sport(sportName: AppSportsStrings.tennisSportName,sportImage: AppSportsStrings.tennisSportImage)
        
        let cricket = Sport(sportName:AppSportsStrings.cricketSportName,sportImage: AppSportsStrings.cricketSportImage)
        
        sports = [football,basketball,tennis,cricket]
        return sports
    }
    
}
