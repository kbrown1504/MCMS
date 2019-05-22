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
    var creature: MagicalCreature?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let creature1 = MagicalCreature(name: "Smaug", description: "A greedy dragon that live in the lonely mountain guarding his treasure.", image: UIImage(named: "Smaug")!, weapon: "Regular Sword", armor: "Regular Armor")
        let creature2 = MagicalCreature(name: "Troll Under the Bridge", description: "A pesky little guy who forces unwitting travelers to answer his riddles.", image: UIImage(named: "troll")!, weapon: "Regular Sword", armor: "Regular Armor")
        let creature3 = MagicalCreature(name: "Shrek", description: "An ogre who once lived a peacful life. In an effort to reclaim his swamp from Lord Farquad, he inadvertantly became a hero and fell in love with a  princess.", image: UIImage(named: "shrek")!, weapon: "Regular Sword", armor: "Regular Armor")
        magicalCreatureArray = [creature1, creature2, creature3]
        self.mainTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        for creature in magicalCreatureArray{
            print(creature.name!)
        }
        mainTableView.reloadData()
    }


    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "Add a Creature", message: "Enter the Creature's name in the first line and a description in the second line.", preferredStyle: .alert)
        ac.addTextField()
        ac.addTextField()
        let submitCreatureAction = UIAlertAction(title: "Submit", style: .default) {
            [unowned ac] _ in
            let answer = ac.textFields![0]
            let answerDesc = ac.textFields![1]
            let answerString = answer.text!
            let answerDescString = answerDesc.text!
            self.creature = (MagicalCreature(name: answerString, description: answerDescString, image: UIImage (named: "insertImage")!, weapon: "Regular Sword", armor: "Regular Armor"))
            self.magicalCreatureArray.append(self.creature!)
            self.mainTableView.reloadData()
        }
        
        ac.addAction(submitCreatureAction)

        self.present(ac, animated: true)
        
        
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
        creature = magicalCreatureArray[indexPath.row]
        let cvc = segue.destination as! CreatureViewController
        cvc.magicalCreature = creature
        cvc.magicalCreatures = self.magicalCreatureArray
    }
    
}

