//
//  BattleViewController.swift
//  MCMS
//
//  Created by Keegan Brown on 5/21/19.
//  Copyright © 2019 Keegan Brown. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {
    
    var userCreature: MagicalCreature!
    var computerCreature: MagicalCreature!
    var weapons : [String] = []
    var armor : [String] = []
    
    var userWeapon : String!
    var userArmor : String!
    
    var userSpeed = 10.0
    var userAttack = 10.0
    var userDR = 10.0
    var userHP = 100.0
    var userMult = 1.0
    
    var computerSpeed = 10.0
    var computerAttack = 10.0
    var computerDR = 10.0
    var computerHP = 100.0
    var computerMult = 1.0
    
    @IBOutlet weak var userCreatureImageView: UIImageView!
    @IBOutlet weak var computerCreatureImageView: UIImageView!
    @IBOutlet weak var computerHealthLabel: UILabel!
    @IBOutlet weak var userHealthLabel: UILabel!
    @IBOutlet weak var battleButton: UIButton!
    @IBOutlet weak var userCurrentEquipLabel: UILabel!
    @IBOutlet weak var computerCurrentEquipLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userWeapon = userCreature.weapon
        userArmor = userCreature.armor
        
        computerCreatureImageView.image = computerCreature.image
        userCreatureImageView.image = userCreature.image
        
        computerHealthLabel.adjustsFontSizeToFitWidth = true
        userHealthLabel.adjustsFontSizeToFitWidth = true
        
        computerCreature.weapon = weapons[Int.random(in: 0...2)]
        computerCreature.armor = armor[Int.random(in: 0...2)]
        
        switch userWeapon{
        case "Flaming Sword":
            userAttack += 3
        case "Assassin Dagger":
            userAttack -= 2
            userMult += 0.75
        default:
            break
            
        }
        
        switch userArmor{
        case "Heavy Armor":
            userHP += 10
            userSpeed -= 5
        case "Light Armor":
            userHP -= 10
            userSpeed += 5
        default:
            break
        }
        
        switch computerCreature.weapon{
        case "Flaming Sword":
            computerAttack += 3
        case "Assassin Dagger":
            computerAttack -= 2
            computerMult += 0.75
        default:
            break
            
        }
        
        switch computerCreature.armor{
        case "Heavy Armor":
            computerHP += 10
            computerSpeed -= 5
        case "Light Armor":
            computerHP -= 10
            computerSpeed += 5
        default:
            break
        }
        
        computerHealthLabel.text = "\(computerCreature.name!) HP: \(computerHP)"
        userHealthLabel.text = "\(userCreature.name!) HP: \(userHP)"
        
        computerCurrentEquipLabel.text = "Weapon: \(computerCreature.weapon!)\nArmor: \(computerCreature.armor!)"
        userCurrentEquipLabel.text = "Weapon: \(userWeapon!)\nArmor: \(userArmor!)"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.white
        battleButton.isUserInteractionEnabled = true
    }
    
    func UserAttack(){
        
        if userWeapon! == "Assassin Dagger"{
            userAttack = 8
            if Int.random(in: 0...1) == 1{
                userAttack = userAttack * userMult
                print("user CRIT : \(userAttack)")
            }
        }
        
        computerHP -= userAttack
        computerHealthLabel.text = "\(computerCreature.name!) HP: \(computerHP)"
    }
    
    func ComputerAttack() {
        
        if computerCreature.weapon == "Assassin Dagger"{
            computerAttack = 8
            if Int.random(in: 0...1) == 1{
                computerAttack = computerAttack * computerMult
                print("Computer CRIT : \(computerAttack)")
            }
        }
        
        userHP -= computerAttack
        userHealthLabel.text = "\(userCreature.name!) HP: \(userHP)"
    }
    
    func checkForWinner(){
        if userHP <= 0{
            userHealthLabel.text = "\(userCreature.name!): KO"
            self.view.backgroundColor = UIColor.red
            battleButton.isUserInteractionEnabled = false
            
        } else if computerHP <= 0 {
            computerHealthLabel.text = "\(computerCreature.name!): KO"
            self.view.backgroundColor = UIColor.green
            battleButton.isUserInteractionEnabled = false
            
        }
    }
    
    
    @IBAction func onAttackPressed(_ sender: UIButton) {
        print("Attack has been pressed")
        
        if (userSpeed == computerSpeed){
            switch Int.random(in: 0...1){
            case 0:
                UserAttack()
                if computerHP > 0{
                    ComputerAttack()
                }
            case 1:
                ComputerAttack()
                if userHP > 0{
                    UserAttack()
                }
            default:
                break
            }
            
        } else if userSpeed > computerSpeed{
            UserAttack()
            if computerHP > 0{
                ComputerAttack()
            }
        } else {
            ComputerAttack()
            if userHP > 0{
                UserAttack()
            }
            
        }
        
        checkForWinner()
        
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
