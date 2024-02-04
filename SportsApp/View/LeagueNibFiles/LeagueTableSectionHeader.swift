//
//  LeagueTableSectionHeader.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 25/01/2024.
//

import UIKit

class LeagueTableSectionHeader: UIView {


    @IBOutlet var headerContainerView: UIView!
    
    @IBOutlet weak var headerTitle: UILabel!
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder : NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    
    func loadNib(){
        
        Bundle.main.loadNibNamed("LeagueTableSectionHeader", owner:self,options: nil)
        
        self.addSubview(headerContainerView)
        
        headerContainerView.frame = self.frame
        headerContainerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    

}
