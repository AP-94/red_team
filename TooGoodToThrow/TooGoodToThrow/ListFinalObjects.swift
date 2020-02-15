//
//  ListarUnidadesViewController.swift
//
//
//  Created by alumnos on 12/02/2020.
//

import UIKit
import Alamofire
import SDWebImage

var id:Int = 1

class ListarUnidadesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    
    var finalObjects = [FinalObject]()
    var idString: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Do any additional setup after loading the view.
        print(idString)
        GetFinalObjects {
            print("Succesful")
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //metodo que define la altura de las celdas
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalObjects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.UnitsName.text = finalObjects[indexPath.row].name
        let baseURL = URL(string: "http://localhost:8888/ToGoodToThrow/storage/app/public/")!
        let remoteImageURL = baseURL.appendingPathComponent(finalObjects[indexPath.row].img!)
        cell.UnitsImage?.sd_setImage(with: remoteImageURL)
        return cell

    }
    
    //metodo que al clicar en una celda hace una accion.
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("celda pulsada")
        id = indexPath.row + 1
        self.performSegue(withIdentifier: "content", sender: nil)

    }
    
    func GetFinalObjects (completed: @escaping () -> ()) {
        let url = URL(string: "http://localhost:8888/ToGoodToThrow/public/api/unit/lesson/\(idObjects)")
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

