//
//  MagicalCreature.swift
//  MCMS
//
//  Created by Keegan Brown on 5/21/19.
//  Copyright © 2019 Keegan Brown. All rights reserved.
//

import UIKit
import Foundation

class MagicalCreature {
    
    var name: String!
    var description: String!
    var weapon: String! //weapons : flaming sword (high damage but chance to hurt self) regular sword (basic damage), assasin dagger (low damage but high change to crit)
    var armor: String! //armor : light (high speed low damage resistance) regular (basic damge resistance, basic speed) heavy armor (high damage resistance but low speed)
    var image: UIImage?
    
    //speed stat can either decide who attacks first or if the defender dodges the attack
    
    init (name: String, description: String, image: UIImage, weapon: String, armor: String){
        self.name = name
        self.description = description
        self.image = image
        self.armor = armor
        self.weapon = weapon
    }
    
}
