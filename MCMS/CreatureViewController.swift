//
//  CreatureViewController.swift
//  MCMS
//
//  Created by Keegan Brown on 5/21/19.
//  Copyright © 2019 Keegan Brown. All rights reserved.
//

import UIKit

class CreatureViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var magicalCreatures : [MagicalCreature] = []
    
    var magicalCreature: MagicalCreature!
    var weaponChoices = ["Regular Sword", "Flaming Sword", "Assassin Dagger"]
    var armorChoices = ["Regular Armor", "Light Armor", "Heavy Armor"]
    var selectedRow : Int?
    
    weak var delegate: ViewController!
    
    @IBOutlet weak var creatureImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weaponPickerView: UIPickerView!
    @IBOutlet weak var armorPickerView: UIPickerView!
    @IBOutlet weak var currentWeaponLabel: UILabel!
    @IBOutlet weak var currentArmorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.weaponPickerView.delegate = self
        self.weaponPickerView.dataSource = self
        self.armorPickerView.delegate = self
        self.armorPickerView.dataSource = self
        
        currentWeaponLabel.text = magicalCreature.weapon
        currentArmorLabel.text = magicalCreature.armor
        
        title = magicalCreature.name
        descriptionLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        descriptionLabel.text = magicalCreature.description
        creatureImageView.image = magicalCreature.image
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreatureViewController.imageTapped(gesture:)))
        
        // add it to the image view;
        creatureImageView.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        creatureImageView.isUserInteractionEnabled = true
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return 3
    }
    
    //sets data to be displayed for each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == weaponPickerView{
            return weaponChoices[row]
        } else {
            return armorChoices[row]
        }
    }
    
    //gets what row is currently selected every time that the pickerView is moved.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == weaponPickerView {
            selectedRow = row
            print(weaponChoices[row])
            magicalCreature.weapon = weaponChoices[row]
        } else {
            selectedRow = row
            print(armorChoices[row])
            magicalCreature.armor = armorChoices[row]
        }
        
        self.currentArmorLabel.text = self.magicalCreature.armor
        self.currentWeaponLabel.text = self.magicalCreature.weapon
    }

    
    
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
            self.creatureImageView.image = self.magicalCreature.image
            
            
        }
        
        editAlertController.addAction(editAlertAction)
        self.present(editAlertController, animated: true)
        
        
    }
    
    //might want to make this so the user can set up the image for their creature from the photo library
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            if creatureImageView.image == UIImage(named: "insertImage"){
                print("image tapped")
            }
            
        }
    }
    
    @IBAction func onBattlePressed(_ sender: Any) {
        print("battle pressed")
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        let bvc = segue.destination as! BattleViewController
        bvc.userCreature = self.magicalCreature
        bvc.computerCreature = self.magicalCreatures[Int.random(in: 0...2)]
        bvc.armor = self.armorChoices
        bvc.weapons = self.weaponChoices
        
        
     }
    
    
}
