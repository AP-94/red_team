//
//  PerfilViewController.swift
//  TooGoodToThrow
//
//  Created by Alessandro Pace on 14/02/2020.
//  Copyright © 2020 Equipo_Rojo. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    let buttonsList = ["Favoritos", "Contacto", "FAQ"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttonsList.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableTableViewCell
        cell.buttonTitle.text = buttonsList[indexPath.row]
        cell.buttonImage.image = UIImage(named: buttonsList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        switch index {
        case 0:
            self.launchScreenFavorites()
        case 1:
            self.launchScreenContacto()
        case 2:
            self.launchScreenFAQ()
        default:
            return
        }
        
    }
    
    func launchScreenFavorites(){
        let vc:FavoritesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FavoritesViewController")
        self.present(vc, animated: true, completion: nil)
    }
    
    func launchScreenContacto(){
        let vc:ContactoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ContactoViewController")
        self.present(vc, animated: true, completion: nil)
    }
    
    func launchScreenFAQ(){
        let vc:FAQViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FAQViewController")
        self.present(vc, animated: true, completion: nil)
    }
}

