//
//  FavouriteTableViewController.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 23/01/2024.
//

import UIKit

class FavouriteTableViewController: UITableViewController {
    
    var favouriteLeaguesViewModel:FavouriteLeaguesViewModel?
    var leagues:[LeagueModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

         tableView.register(UINib(nibName:"LeagueTableViewCell", bundle: nil), forCellReuseIdentifier:"leagueCell")
        
        leagues = favouriteLeaguesViewModel?.fetch() ?? []
        tableView.reloadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        leagues = favouriteLeaguesViewModel?.fetch() ?? []
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return leagues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueTableViewCell
        
        cell.leagueTitle.text = leagues[indexPath.row].leagueName
        
 
        if leagues[indexPath.row].leagueLogo != nil{
            

            let url = URL(string: leagues[indexPath.row].leagueLogo!)
            cell.leagueImageView.kf.setImage(with:url)
            
        }else{
            
            cell.leagueImageView.image = UIImage(named: AppSportsStrings.defaultAppImage)
        }
        
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let teamsURL = EndPointUrlStrings
            .getTeamsURL(sportName:leagues[indexPath.row].sportName ?? "football",leagueKey: String(leagues[indexPath.row].leagueKey ?? 0))
        
        let eventsURL = EndPointUrlStrings
            .getEventsURL(sportName:leagues[indexPath.row].sportName ?? "football", leagueKey: String(leagues[indexPath.row].leagueKey ?? 0))
        
        print(teamsURL)
        print("league key ///////////  \(String(leagues[indexPath.row].leagueKey ?? 0))")
        
        LeagueDetailsDependencyProvider.teamsUrl = teamsURL
        LeagueDetailsDependencyProvider.eventsUrl = eventsURL
        
        LeagueDetailsDependencyProvider.league = leagues[indexPath.row]
        
        let vc = LeagueDetailsDependencyProvider.leagueDetailsCollectionViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70;//Choose your custom row height
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            print("delete")
            favouriteLeaguesViewModel?.delete(league: leagues[indexPath.row])
            leagues = favouriteLeaguesViewModel?.fetch() ?? []
            tableView.reloadData()

        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = LeagueTableSectionHeader()
        headerView.headerTitle.text = "FAVOURITE"
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }


}
 
