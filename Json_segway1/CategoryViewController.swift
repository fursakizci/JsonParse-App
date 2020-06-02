//
//  CategoryViewController.swift
//  Json_segway1
//
//  Created by Furkan sakızcı on 30.07.2019.
//  Copyright © 2019 Furkan sakızcı. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    var arr = [[String:Any]]()
    var damage:String?
    @IBOutlet weak var categoryTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    categoryTable.dataSource = self
    categoryTable.delegate = self
        json()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arr[section]["damage_types"] as! [[String:String]]).count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let damageArray = arr[indexPath.section]["damage_types"] as! [[String:String]]
        let damageDict = damageArray[indexPath.row]
        cell.textLabel?.text = damageDict["damage_type"]
        return cell
    }
   
    func json()  {
        guard let path = Bundle.main.path(forResource: "hasar_aninda_yapilacaklar2", ofType: "json") else { return}
        let url = URL(fileURLWithPath: path)
        do{
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
            guard let hasarlarArr = json?["hasarlar"] as? [[String:Any]] else{return}
            
            arr = hasarlarArr
        }catch{
                print(error)
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let damageArray = arr[indexPath.section]["damage_types"] as! [[String:String]]
        
        
        let damageDict = damageArray[indexPath.row]
       
        
        damage = damageDict["description"]
        performSegue(withIdentifier: "goToView", sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToView"{
            let destinationVC = segue.destination as! ViewController
            destinationVC.name = damage
        }
    }
    
    
    
    
}
