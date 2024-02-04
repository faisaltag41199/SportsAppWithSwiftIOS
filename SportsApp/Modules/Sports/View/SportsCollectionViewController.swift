//
//  SportsCollectionViewController.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 22/01/2024.
//

import UIKit

class SportsCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var sportsViewModel:SportsViewModel?
    var sports:[Sport] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        sports = sportsViewModel?.getSports() ?? []
        collectionView.reloadData()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sports.count
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
            
            case 0:
                
                LeaguesDependencyProvider.sportName = "football"
                LeaguesDependencyProvider.leaguesURL = EndPointUrlStrings.getLeaguesURL(sportName:"football")
                
                let viewController = LeaguesDependencyProvider.leaguesTableViewController
                self.present(viewController, animated: true, completion: nil)

            case 1:
                LeaguesDependencyProvider.sportName = "basketball"
                LeaguesDependencyProvider.leaguesURL = EndPointUrlStrings.getLeaguesURL(sportName:"basketball")
            
                let viewController = LeaguesDependencyProvider.leaguesTableViewController
                self.present(viewController, animated: true, completion: nil)
            
            case 2:
                
                LeaguesDependencyProvider.sportName = "tennis"
                LeaguesDependencyProvider.leaguesURL = EndPointUrlStrings.getLeaguesURL(sportName:"tennis")
            
                let viewController = LeaguesDependencyProvider.leaguesTableViewController
                self.present(viewController, animated: true, completion: nil)
            case 3:
            
                LeaguesDependencyProvider.sportName = "cricket"
                LeaguesDependencyProvider.leaguesURL = EndPointUrlStrings.getLeaguesURL(sportName:"cricket")
            
                let viewController = LeaguesDependencyProvider.leaguesTableViewController
                self.present(viewController, animated: true, completion: nil)
            
            default:
                break
        }
        
        print("item index \(indexPath.item)")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportsCell", for: indexPath) as! SportsCollectionViewCell
        
        
        cell.sportTitle.text = sports[indexPath.item].sportName
        cell.sportImageView.image = UIImage(named:sports[indexPath.item].sportImage ?? "")

        
        cell.sportImageView.layer.borderWidth = 1.0
        cell.sportImageView.layer.masksToBounds = false
        cell.sportImageView.layer.borderColor = UIColor.white.cgColor
        cell.sportImageView.layer.cornerRadius = 10.0
        cell.sportImageView.clipsToBounds = true

        let tintView = UIView()
        tintView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        tintView.frame = CGRect(x: 0, y: 0, width: cell.sportImageView.frame.width, height: cell.sportImageView.frame.height)
        
        cell.sportImageView.addSubview(tintView)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {

           return CGSize(width: 196.5, height: 120)

       }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeader
             sectionHeader.label.text = "SPORTS"
             return sectionHeader
        } else { //No footer in this case but can add option for that
             return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
    
}

class SectionHeader: UICollectionReusableView {
    
     var label: UILabel = {
         let label: UILabel = UILabel()
         label.textColor = .black
         label.textAlignment = .center
         label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
         label.sizeToFit()
         return label
     }()

     override init(frame: CGRect) {
         super.init(frame: frame)

         addSubview(label)

         label.translatesAutoresizingMaskIntoConstraints = false
         label.topAnchor.constraint(equalTo: self.topAnchor,constant:12).isActive = true
         label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
         label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
