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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magicalCreatureArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "CellID") as! UITableViewCell
        cell.textLabel?.text = magicalCreatureArray[indexPath.row].name!
        
        return cell
        
    }

}

