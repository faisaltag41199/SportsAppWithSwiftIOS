//
//  TeamDependencyProvider.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 02/02/2024.
//

import Foundation
import UIKit


class TeamDependencyProvider{
    
    
    static var team:TeamModel?

    static var teamViewController: TeamViewController {
        
        let teamViewControllerInstance
         = UIStoryboard(name: "Main",bundle:nil).instantiateViewController(withIdentifier: "teamViewController") as! TeamViewController
        
        teamViewControllerInstance.team = TeamDependencyProvider.team
        return teamViewControllerInstance
    }
    
}
