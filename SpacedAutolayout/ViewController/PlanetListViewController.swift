//
//  PlanetListViewController.swift
//  SpacedAutolayout
//
//  Created by Chandrakant Naik on 29/03/21.
//

import UIKit

class PlanetListViewController: UIViewController {
    
    @IBOutlet weak var tvPlanets: UITableView!
    let segueId = "showPlanetDetail"
    
    var planetList:[Planet] = [Planet(name: "Moon", distance: "384K", noOfVoyages: 3890, image: UIImage(named: "moon")!
                                      , description: "An astronomical body that orbits planet Earth, being Earth's only permanent natural satellite. Contrary to the popular belief, the Moon is not made of Cheese, space rocks are hard to digest. Instead try the SPACED Cafe that provides amazing meals and delicacy 24x7."
                                      , cost: "2399"),
                               Planet(name: "Mars", distance: "55M", noOfVoyages: 1389, image: UIImage(named: "mars")!
                                      , description: "An astronomical body that orbits planet Earth, being Earth's only permanent natural satellite. Contrary to the popular belief, the Moon is not made of Cheese, space rocks are hard to digest. Instead try the SPACED Cafe that provides amazing meals and delicacy 24x7."
                                      , cost: "3399")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView() {
        tvPlanets.delegate = self
        tvPlanets.dataSource = self
        tvPlanets.register(UINib(nibName: "PlanetTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tvPlanets.backgroundView = nil
        tvPlanets.backgroundColor = UIColor.clear
        tvPlanets.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId, let destinationVC = segue.destination as? PlanetDetailViewController {
            destinationVC.planet = sender as? Planet
        }
    }
}

//MARK:- Planet List
extension PlanetListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.planetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let planetCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlanetTableViewCell
        planetCell.listener = self
        let planet = self.planetList[indexPath.row]
        planetCell.backgroundColor = UIColor.clear
        planetCell.lblPlanetName.text = planet.name
        planetCell.lblNoOfVoyages.text = String(planet.noOfVoyages) + " Voyages"
        planetCell.lblDistanceFromEarth.text = planet.distance + " KM"
        planetCell.ivPlaner.image = planet.image
        return planetCell
    }
    
    //autoresizing tableview cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  self.performSegue(withIdentifier: segueId, sender: self)
    }
}

//MARK: - Listner callback

extension PlanetListViewController: PlanetCellListener {
    func onKnowMoreClicked(_ button: UIButton, _ cell: UITableViewCell) {
        //  if let vc = self.storyboard?.instantiateViewController(identifier: segueId) as? PlanetDetailViewController {
        // self.present(vc, animated: true, completion: nil)
        if let pCell = cell as? PlanetTableViewCell {
            if let actualIndexPath = self.tvPlanets.indexPath(for: pCell) {
                let planet = planetList[actualIndexPath.row]
                self.performSegue(withIdentifier: segueId, sender: planet)
            }
        }
        //  }
    }
}
