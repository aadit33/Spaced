//
//  PlanetTableViewCell.swift
//  SpacedAutolayout
//
//  Created by Chandrakant Naik on 29/03/21.
//

import UIKit

protocol PlanetCellListener {
    func onKnowMoreClicked(_ button: UIButton, _ cell: UITableViewCell)
}

class PlanetTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPlanetName: UILabel!
    @IBOutlet weak var lblNoOfVoyages: UILabel!
    @IBOutlet weak var lblDistanceFromEarth: UILabel!
    @IBOutlet weak var ivPlaner: UIImageView!
    @IBOutlet weak var btnKnowMore: UIButton!
    
    var listener: PlanetCellListener?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnKnowMore.applyGradient(colors: [Utilities.hexStringToUIColor("104494").cgColor, Utilities.hexStringToUIColor("66D9EF").cgColor])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onKnowMorePressed(_ sender: UIButton) {
        if let delegate = listener {
            delegate.onKnowMoreClicked(sender, self)
        }
    }
}
