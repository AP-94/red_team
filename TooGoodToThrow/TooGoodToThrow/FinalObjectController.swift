//
//  UnidadViewController.swift
//  AutoPro-iOS
//
//  Created by alumnos on 29/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//
/*
import UIKit
import Alamofire
import SDWebImage

var finalObjects = FinalObjects()

class UnidadViewController: UIViewController {
    
    @IBOutlet weak var unidadLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    var myString: String? = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        unidadLabel.text = myString
        
        GetFinalObjects {_ in
            print(finalObjects)
            self.contentLabel.text = finalObjects.explain
        }
        
    }
    
    //Peticion de Contenido del tema
    func GetFinalObjects (completed: @escaping (Unidad) -> (Void)) {
        let url = URL(string: "http://localhost:8888/ToGoodToThrow/public/api/object/\(id)")
        
        Alamofire.request(url!, method: .get, headers: nil).responseJSON { (response) in
            print(response)
            
            do {
                finalObjects = try JSONDecoder().decode(Unidad.self, from: response.data!)
                DispatchQueue.main.async{
                    print(finalObjects)
                    self.unidadLabel.text = finalObjects.name
                    self.contentLabel.text = finalObjects.explain
                }
                
            }catch {
                print(error)
                
            }
        }.resume()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
 
 */

