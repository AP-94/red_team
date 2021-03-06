//
//  BuscadorViewController.swift
//  TooGoodToThrow
//
//  Created by Alessandro Pace on 14/02/2020.
//  Copyright © 2020 Equipo_Rojo. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

private let reuseIdentifier = "MiCelda"
private let itemsPerRow = 2
private let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 10.0, right: 20.0)
var id: Int = 1

class BuscadorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!

    var finalObjects = [FinalObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        GetfinalObject{
            print("Succesful")
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * CGFloat(itemsPerRow + 3)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / CGFloat(itemsPerRow)
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return finalObjects.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : BuscadorBigCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BuscadorBigCollectionViewCell
        
        
        //Configurar la celda
        cell.tituloProducto.text = finalObjects[indexPath.row].name
        
        let baseURL = URL(string: "http://localhost:8888/ToGoodToThrow-master/storage/app/public/")!
        let remoteImageURL = baseURL.appendingPathComponent(finalObjects[indexPath.row].img!)
        cell.imagenProducto?.sd_setImage(with: remoteImageURL)
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        id = indexPath.row + 1
        self.launchScreenDetail()
    }
    
    func launchScreenDetail(){
        let vc:FinalObjectController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FinalObjectController")
        self.present(vc, animated: true, completion: nil)
    }
    
    //Peticion de objetos
       func GetfinalObject (completed: @escaping () -> ()) {
           let url = URL(string: "http://localhost:8888/ToGoodToThrow-master/public/api/object")
           Alamofire.request(url!, method: .get, headers: nil).responseJSON { (response) in
               print(response)
               do {
                   self.finalObjects = try JSONDecoder().decode([FinalObject].self, from: response.data!)
                   DispatchQueue.main.async{
                       completed()
                   }
                   
               }catch {
                   print(error)
                  
               }
           }.resume()
           
       }
    
    
}
