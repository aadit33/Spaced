//
//  TestViewController.swift
//  SpacedAutolayout
//
//  Created by Chandrakant Naik on 31/03/21.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var btnTest: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnTest.applyGradient(colors: [Utilities.hexStringToUIColor("104494").cgColor, Utilities.hexStringToUIColor("66D9EF").cgColor])
        // Do any additional setup after loading the view.
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
