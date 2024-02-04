//
//  EventsCollectionViewController.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 26/01/2024.
//

import UIKit
import Kingfisher

class LeagueDetailsCollectionViewController: UICollectionViewController {

    var teams:[TeamModel] = []
    var upcomingEvents:[EventModel] = []
    var latestEvents:[EventModel] = []
    var eventsViewModel:EventsViewModel?
    var teamsViewModel:TeamsViewModel?
    var leagueDetailsViewModel:LeagueDetailsViewModel?
    var league:LeagueModel?
    var leagueDetailsHeaderView : LeagueDetailsHeaderView!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewCompositionalLayout{index, environment in
                 
            switch index {
                case 0 :
                    print("index \(index)")
                    return self.drawTeamsSection()
                case 1 :
                    print("index \(index)")
                    return self.drawUpCommingEventsSection()
                case 2 :
                    print("index \(index)")
                    return self.drawLatestEventsSection()
                default:
                    break
            }
            
            return self.drawTeamsSection()
            
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        showData()

    }
    
    func showData(){
        
        teamsViewModel?.bindTeamsResultToViewController = {
            self.teams = self.teamsViewModel?.getData() ?? []
            self.collectionView.reloadData()
        }
        
        self.teamsViewModel?.loadData()

        eventsViewModel?.bindUpcomingEventsResultToViewController = {

            self.upcomingEvents = self.eventsViewModel?.getUpcomingEvents() ?? []
            self.collectionView.reloadData()

        }
        eventsViewModel?.bindLatestEventsResultToViewController = {

            self.latestEvents = self.eventsViewModel?.getLatestEvents() ?? []
            self.collectionView.reloadData()

        }

        self.eventsViewModel?.loadData()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if(indexPath.section == 0){
            
            print("indexPath.section == 0")
            
            if kind == UICollectionView.elementKindSectionHeader {
                
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "leagueDetailsHeaderView", for: indexPath) as! LeagueDetailsHeaderView
                
                header.addToFavourite = self.addToFavourite
                header.legueName.text = league?.leagueName ?? "league name"
                
                let isExist = leagueDetailsViewModel?.isExist(league: league!) ?? false
                
                if isExist{
                    
                    if let image = UIImage(named:"heartFillSmall.png") {
                        header.favourite.setImage(image, for: .normal)
                    }
                    
                }else{
                    
                    if let image = UIImage(named:"heartSmall.png"){
                        header.favourite.setImage(image,for: .normal)
                    }
                }
                
                leagueDetailsHeaderView = header
                
                return header
            } else { //No footer in this case but can add option for that
                return UICollectionReusableView()
            }
        }
        return UICollectionReusableView()
    }
    
    

     
    func addToFavourite(){
        
        let isExist = leagueDetailsViewModel?.isExist(league: league!) ?? false
        
        if isExist{
            
            if let image = UIImage(named:"heartSmall.png"){
                leagueDetailsHeaderView.favourite.setImage(image,for: .normal)
            }
            
            leagueDetailsViewModel?.delete(league: league!)
            
        } else{
            
            if let image = UIImage(named:"heartFillSmall.png") {
                leagueDetailsHeaderView.favourite.setImage(image, for: .normal)
            }
            
            leagueDetailsViewModel?.insert(league: league!)
        }
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        switch section {
            
            case 0:
                return teams.count
            case 1:
                return upcomingEvents.count
            case 2:
                return latestEvents.count
            default:
                break
        }
        
        return 0
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                       
        switch indexPath.section{
            
            case 0:
                return getTeamCell(collectionView: collectionView, indexPath: indexPath)
                
            case 1:
                return getUpcomingEventCell(collectionView:collectionView,indexPath: indexPath)
            
            case 2:
                return getLatestEventCell(collectionView:collectionView,indexPath: indexPath)
                
            default:
                break
        }
        
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            TeamDependencyProvider.team = teams[indexPath.item]
            let vc = TeamDependencyProvider.teamViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func getTeamCell(collectionView:UICollectionView,indexPath: IndexPath)-> UICollectionViewCell {
        
        let teamCell = collectionView.dequeueReusableCell(withReuseIdentifier:"teamsCell", for:indexPath) as? TeamsCollectionViewCell
        
        teamCell?.teamContainerView.layer.cornerRadius = 10.0
        teamCell?.teamContainerView.clipsToBounds = true
        teamCell?.teamName.text = teams[indexPath.item].teamName
    
        if(teams[indexPath.item].teamLogo == nil){
            
            teamCell?.teamImageView.image = UIImage(named: AppSportsStrings.defaultAppImage)
        }else{
            let url = URL(string: teams[indexPath.item].teamLogo!)
            teamCell?.teamImageView.kf.setImage(with:url)
        }

        return teamCell ?? UICollectionViewCell()
        
    }
    
    func getUpcomingEventCell(collectionView:UICollectionView,indexPath: IndexPath)-> UICollectionViewCell {
        
        let upcomingCell = collectionView.dequeueReusableCell(withReuseIdentifier:"upcomingCell", for:indexPath) as? UpcomingEventsCollectionViewCell
        
        upcomingCell?.contentView.layer.cornerRadius = 10.0
        upcomingCell?.contentView.clipsToBounds = true
        
        if(upcomingEvents[indexPath.item].firstTeamImage == nil){
            
            upcomingCell?.firstTeamImageView.image = UIImage(named: AppSportsStrings.defaultAppImage)
        }else{
            let url = URL(string:upcomingEvents[indexPath.item].firstTeamImage!)
            upcomingCell?.firstTeamImageView.kf.setImage(with:url)
        }
        
        upcomingCell?.firstTeamName.text = upcomingEvents[indexPath.item].firstTeamName
        
        if(upcomingEvents[indexPath.item].secondTeamImage == nil){
            
            upcomingCell?.secondTeamImageView.image = UIImage(named: AppSportsStrings.defaultAppImage)
        }else{
            
            let url = URL(string:upcomingEvents[indexPath.item].secondTeamImage!)
            upcomingCell?.secondTeamImageView.kf.setImage(with:url)
        }
        
        upcomingCell?.secondTeamName.text = upcomingEvents[indexPath.item].secondTeamName
        
        upcomingCell?.MatchDateLabel.text = upcomingEvents[indexPath.item].eventDate
        upcomingCell?.matchTimeLabel.text = upcomingEvents[indexPath.item].eventTime


        return upcomingCell ?? UICollectionViewCell()
        
    }


    func getLatestEventCell(collectionView:UICollectionView,indexPath: IndexPath)-> UICollectionViewCell {
        
        let latestCell = collectionView.dequeueReusableCell(withReuseIdentifier:"latestCell", for:indexPath) as? LatestEventsCollectionViewCell
    
        latestCell?.contentView.layer.cornerRadius =  10.0
        latestCell?.contentView.clipsToBounds = true
        
        
        if(latestEvents[indexPath.item].firstTeamImage == nil){
            
            latestCell?.firstTeamImageView.image = UIImage(named: AppSportsStrings.defaultAppImage)
        }else{
            let url = URL(string:latestEvents[indexPath.item].firstTeamImage!)
            latestCell?.firstTeamImageView.kf.setImage(with:url)
        }
        
        latestCell?.firstTeamName.text = latestEvents[indexPath.item].firstTeamName
        
        if(latestEvents[indexPath.item].secondTeamImage == nil){
            
            latestCell?.secondTeamImageView.image = UIImage(named: AppSportsStrings.defaultAppImage)
        }else{
            
            let url = URL(string:latestEvents[indexPath.item].secondTeamImage!)
            latestCell?.secondTeamImageView.kf.setImage(with:url)
        }
        
        latestCell?.secondTeamName.text = latestEvents[indexPath.item].secondTeamName
        
        latestCell?.MatchResult.text = latestEvents[indexPath.item].eventFinalResult

        return latestCell ?? UICollectionViewCell()
        
    }

    func drawTeamsSection() -> NSCollectionLayoutSection{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(150))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 32)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 0)
        
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(60.0))

        let header = NSCollectionLayoutBoundarySupplementaryItem(
                      layoutSize: footerHeaderSize,
                      elementKind: UICollectionView.elementKindSectionHeader,
                      alignment: .top)
        
        section.boundarySupplementaryItems = [header]

        return section
    }
    
    func drawUpCommingEventsSection() -> NSCollectionLayoutSection{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.90), heightDimension: .absolute(200))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 32)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 0)
            
        return section
    }
    
    func drawLatestEventsSection() -> NSCollectionLayoutSection{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(170))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.23))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom:0, trailing: 10)
            
        let section = NSCollectionLayoutSection(group: group)
        
       // section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
        
                
        return section
    }
    
    
}

class LeagueDetailsHeaderView : UICollectionReusableView{
    
    
    @IBOutlet weak var legueName: UILabel!
    @IBOutlet weak var favourite: UIButton!
    
    var addToFavourite:()->Void = {}
    
    @IBAction func addToFavourite(_ sender: Any) {
        addToFavourite()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(self)
        addSubview(legueName)
        addSubview(favourite)
        
   }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)

    }
    
}
