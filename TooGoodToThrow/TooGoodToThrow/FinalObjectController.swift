//
//  UnidadViewController.swift
//  AutoPro-iOS
//
//  Created by alumnos on 29/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

var finalObjects = FinalObject()

class FinalObjectController: UIViewController {
    
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    var myString: String? = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //nombreLabel.text = myString
        
        GetFinalObjects {_ in
            print(finalObjects)
            self.explainLabel.text = finalObjects.explain
        }
        
    }
    
    //Peticion de Contenido del tema
    func GetFinalObjects (completed: @escaping (FinalObject) -> (Void)) {
        let url = URL(string: "http://localhost:8888/ToGoodToThrow-master/public/api/object/1")
        
        Alamofire.request(url!, method: .get, headers: nil).responseJSON { (response) in
            print(response)
            
            do {
                finalObjects = try JSONDecoder().decode(FinalObject.self, from: response.data!)
                DispatchQueue.main.async{
                    print(finalObjects)
                    self.nombreLabel.text = finalObjects.name
                    self.explainLabel.text = finalObjects.explain
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


