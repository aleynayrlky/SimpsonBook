//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Aleyna Yerlikaya on 2.03.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "nuclear safety", simpsonImage: UIImage(named: "homer")!)
        let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "housewife", simpsonImage: UIImage(named: "marge")!)
        let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "student", simpsonImage: UIImage(named: "bart")!)
        let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "student", simpsonImage: UIImage(named: "lisa")!)
        let maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "baby", simpsonImage: UIImage(named: "maggie")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }


}

