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
        let editAlertController = UIAlertController(title: "Edit Creature Name", message: nil, preferredStyle: .alert)
        editAlertController.addTextField()
        let editAlertAction = UIAlertAction(title: "Sumbit", style: .default){
            [unowned editAlertController] _ in
            let edit = editAlertController.textFields![0]
            self.magicalCreature.name = edit.text
            self.title = self.magicalCreature.name
            
            
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
