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


class BuscadorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrayProductos = ["Tecnología","Botella","Cartón","Textil","Latas","Muebles"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return arrayProductos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : BuscadorBigCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BuscadorBigCollectionViewCell
        
        
        //Configurar la celda
        cell.backgroundColor = .orange
        cell.tituloProducto.text = "Index: \(indexPath.row)"
        return cell
        
        
        
    }
    
    
}
