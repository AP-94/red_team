//
//  TemarioViewController.swift
//  AutoPro-iOS
//
//  Created by user161846 on 1/29/20.
//  Copyright © 2020 alumnos. All rights reserved.
//
/*
import UIKit
import Alamofire
import SDWebImage

var objectToReuse = [ObjectToReuse]()
var idObjects:Int = 1
var idObjectToReuse: Int?

class TemarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var objectToReuseString: String = ""
    var idString: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        GetLessons{
            print("Succesful")
            self.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self

    }
    
   //metodo que indicamos que el tabeView tenga el mismo tamaño que el array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectToReuse.count
    }
    //metodo que define la altura de las celdas
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    //metodo que al clicar en una celda hace una accion.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("celda pulsada")
        objectToReuseString = objectToReuse[indexPath.row].name!.capitalized
        idObjectToReuse = objectToReuse[indexPath.row].id
        self.performSegue(withIdentifier: "infoView", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item = ( sender as? CustomTableViewCell) else { return }
        guard let indexPath = self.tableView.indexPath(for: item) else {return}
        let idObjectToReuse = objectToReuse[indexPath.row].id
        let idObjectToReusetring:String = "\(idObjectToReuse)"
        let info = segue.destination as! ListarUnidadesViewController
        info.idString = "\(idObjectToReuse!)" as! String

    }
    
    //Este método: cellForRowAtIndexPath(), nos permite especificar los datos que mostraremos en cada celda y se ejecutará tantas veces como le hayamos indicado en el numberofrowsSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.labelsUnits.text = objectToReuse[indexPath.row].name
        let baseURL = URL(string: "http://localhost:8888/ToGoodToThrow/storage/app/public/")!
        let placeholderImage = UIImage(named: "autoescuela-logo.png")
        let remoteImageURL = baseURL.appendingPathComponent(objectToReuse[indexPath.row].img!)
        print(remoteImageURL)
        cell.imageUnits?.sd_setImage(with: remoteImageURL, placeholderImage: placeholderImage)
        return cell
        
    }
    //Peticion de Temas
    func GetObjectToReuse (completed: @escaping () -> ()) {
        let url = URL(string: "http://localhost:8888/ToGoodToThrow/public/api/objecttoreuse")
        Alamofire.request(url!, method: .get, headers: nil).responseJSON { (response) in
            print(response)
            do {
                objectToReuse = try JSONDecoder().decode([ObjectToReuse].self, from: response.data!)
                DispatchQueue.main.async{
                    completed()
                }
                
            }catch {
                print(error)
               
            }
        }.resume()
        
    }
    
}

*/
