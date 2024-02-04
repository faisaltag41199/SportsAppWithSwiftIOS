//
//  SportsDependencyProvider.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 28/01/2024.
//

import Foundation
import UIKit

class SportsDependencyProvider{
    
    static var sportsViewModel:SportsViewModel {
        return SportsViewModelImplementation()
    }
    
    static var sportsCollectionViewController: SportsCollectionViewController {
        
        let sportsCollectionViewControllerInstance
         = UIStoryboard(name: "Main",bundle:nil).instantiateViewController(withIdentifier: "sportsCollectionViewController") as! SportsCollectionViewController
        
        sportsCollectionViewControllerInstance.sportsViewModel = sportsViewModel
        return sportsCollectionViewControllerInstance
    }
    
}
