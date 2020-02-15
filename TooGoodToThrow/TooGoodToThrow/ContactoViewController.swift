//
//  ContactoViewController.swift
//  TooGoodToThrow
//
//  Created by Alessandro Pace on 14/02/2020.
//  Copyright © 2020 Equipo_Rojo. All rights reserved.
//

import UIKit

class ContactoViewController: UIViewController {

    @IBOutlet weak var cerrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cerrar(_ sender: UIButton) {
        self.dismiss(animated: true,completion: nil)
    }

}
