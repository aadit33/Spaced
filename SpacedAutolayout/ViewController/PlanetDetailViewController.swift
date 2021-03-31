//
//  PlanetDetailViewController.swift
//  SpacedAutolayout
//
//  Created by Chandrakant Naik on 29/03/21.
//

import UIKit

class PlanetDetailViewController: UIViewController {

    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblVoyage: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblVoyageCost: UILabel!
    @IBOutlet weak var btnBookNow: UIButton!
    @IBOutlet weak var ivPlanet: UIImageView!
    
    var planet: Planet?
    
// MARK: VC METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let guradPlanet = planet {
            lblName.text = guradPlanet.name
            lblDistance.text = guradPlanet.distance + " KM"
            lblDesc.text = guradPlanet.description
            lblVoyage.text = String(guradPlanet.noOfVoyages)
            lblVoyageCost.text = guradPlanet.cost
            ivPlanet.image = guradPlanet.image
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        btnBookNow.applyGradient(colors: [Utilities.hexStringToUIColor("104494").cgColor, Utilities.hexStringToUIColor("66D9EF").cgColor])
    }

    //MARK: - ALL IB ACTIONS
    @IBAction func onBackPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onBookNowPressed(_ sender: UIButton) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
