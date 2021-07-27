//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Furkan Erzurumlu on 7.07.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var simpsonsArray = [simpsonFeature]()
    var chosenSimpson : simpsonFeature?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .yellow
        //Simpson Class
        let homer = simpsonFeature(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Safety Inspector", simpsonImage: UIImage(named: "homerSimpsons")!)
        
        
        let bart = simpsonFeature(simpsonName: "Bart Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "bartSimpsons")!)
      
        
        let marge = simpsonFeature(simpsonName: "Marge Simpson", simpsonJob: "Housewife", simpsonImage: UIImage(named: "margeSimpson")!)
     
        
        let lisa = simpsonFeature(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "lisaSimpson")!)

        
        let margaret = simpsonFeature(simpsonName: "Margaret Lenny Simpson", simpsonJob: "Baby", simpsonImage: UIImage(named: "margaretLennySimpson")!)
        
        simpsonsArray.append(homer)
        simpsonsArray.append(bart)
        simpsonsArray.append(marge)
        simpsonsArray.append(lisa)
        simpsonsArray.append(margaret)
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsonsArray[indexPath.row].name
        cell.backgroundColor = .yellow
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonsArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
    
    
}

