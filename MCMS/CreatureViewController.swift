//
//  CreatureViewController.swift
//  MCMS
//
//  Created by Keegan Brown on 5/21/19.
//  Copyright © 2019 Keegan Brown. All rights reserved.
//

import UIKit

class CreatureViewController: UIViewController {
    
    var magicalCreature: MagicalCreature!
    
    weak var delegate: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = magicalCreature.name
        descriptionLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        descriptionLabel.text = magicalCreature.description
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBAction func onEditPressed(_ sender: UIBarButtonItem) {
        
        print ("edit pressed")
        
        //allow user to edit
        let editAlertController = UIAlertController(title: "Edit Creature Name and Description", message: "Enter a new creature name in the first line and a new description in the second line.", preferredStyle: .alert)
        editAlertController.addTextField()
        editAlertController.addTextField()
        let editAlertAction = UIAlertAction(title: "Sumbit", style: .default){
            [unowned editAlertController] _ in
            let edit = editAlertController.textFields![0]
            let editDesc = editAlertController.textFields![1]
            self.magicalCreature.name = edit.text
            self.magicalCreature.description = editDesc.text
            self.title = self.magicalCreature.name
            self.descriptionLabel.text = self.magicalCreature.description
            
            
        }
        
        editAlertController.addAction(editAlertAction)
        self.present(editAlertController, animated: true)
        
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
