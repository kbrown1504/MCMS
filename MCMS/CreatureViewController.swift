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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = magicalCreature.name
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onEditPressed(_ sender: UIBarButtonItem) {
        
        print ("edit pressed")
        
        //allow user to edit
        let editAlertController = UIAlertController(title: "Edit Creature Name", message: nil, preferredStyle: .alert)
        editAlertController.addTextField()
        let editAlertAction = UIAlertAction(title: "Sumbit", style: .default){
            [unowned editAlertController] _ in
            let edit = editAlertController.textFields![0]
            self.magicalCreature = MagicalCreature(name: edit.text!)
            self.title = self.magicalCreature.name
            
            
        }
        
        editAlertController.addAction(editAlertAction)
        self.present(editAlertController, animated: true)
        
        //doesn't seem to be working
        let VC = ViewController()
        VC.creature = magicalCreature
        navigationController?.pushViewController(VC, animated: true)
        
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
