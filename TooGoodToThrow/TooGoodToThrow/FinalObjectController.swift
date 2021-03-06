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
    @IBOutlet weak var imageObject: UIImageView!
    @IBOutlet weak var herramientas: UILabel!
    @IBOutlet weak var dificultad: UILabel!
    
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
        let url = URL(string: "http://localhost:8888/ToGoodToThrow-master/public/api/object/\(id)")
        
        Alamofire.request(url!, method: .get, headers: nil).responseJSON { (response) in
            
            do {
                finalObjects = try JSONDecoder().decode(FinalObject.self, from: response.data!)
                DispatchQueue.main.async{
                    self.nombreLabel.text = finalObjects.name
                    self.explainLabel.text = finalObjects.explain
                    self.herramientas.text = finalObjects.tools
                    self.dificultad.text = finalObjects.skill
                    
                    let baseURL = URL(string: "http://localhost:8888/ToGoodToThrow-master/storage/app/public/")!
                    let remoteImageURL = baseURL.appendingPathComponent(finalObjects.img!)
                    self.imageObject?.sd_setImage(with: remoteImageURL)
                    
                }
                
            }catch {
                print(error)
                
            }
        }.resume()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}


