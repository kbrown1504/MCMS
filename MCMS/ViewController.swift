//
//  ViewController.swift
//  MCMS
//
//  Created by Keegan Brown on 5/21/19.
//  Copyright © 2019 Keegan Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var magicalCreatureArray: [MagicalCreature] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let creature1 = MagicalCreature(name: "Smaug")
        let creature2 = MagicalCreature(name: "Troll Under the Bridge")
        let creature3 = MagicalCreature(name: "Shrek")
        magicalCreatureArray = [creature1, creature2, creature3]
        
    }

    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "Add a Creature", message: "Enter the Creature's name", preferredStyle: .alert)
        ac.addTextField()
        let submitCreatureAction = UIAlertAction(title: "Submit", style: .default) {
            [unowned ac] _ in
            let answer = ac.textFields![0]
            let answerString = answer.text!
            self.magicalCreatureArray.append(MagicalCreature(name: answerString))
            self.mainTableView.reloadData()
        }
        
        ac.addAction(submitCreatureAction)
        
        present(ac, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magicalCreatureArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "CellID") as! UITableViewCell
        cell.textLabel?.text = magicalCreatureArray[indexPath.row].name!
        
        return cell
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = mainTableView.indexPathForSelectedRow!
        let creature = magicalCreatureArray[indexPath.row]
        let cvc = segue.destination as! CreatureViewController
        cvc.magicalCreature = creature
    }
    
}

