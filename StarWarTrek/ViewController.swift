//
//  ViewController.swift
//  StarWarTrek
//
//  Created by James Campagno on 10/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var kirkImage: UIImageView!
    
    @IBOutlet weak var mccoyImage: UIImageView!
    
    @IBOutlet weak var spockImage: UIImageView!
    
    @IBOutlet weak var uhuruImage: UIImageView!
    
    @IBOutlet weak var hanImage: UIImageView!
    
    @IBOutlet weak var chewyImage: UIImageView!
    
    @IBOutlet weak var lukeImage: UIImageView!
    
    @IBOutlet weak var anakinImage: UIImageView!
    
    
    var starWarsCharacter: UIImageView!
    
    var starTrekCharacter: UIImageView!
    
    var starTrekArray: [UIImageView] = []
    
    var starWarsArray:  [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGestures()
        
        starTrekArray = [kirkImage, mccoyImage, spockImage, uhuruImage]
        
        starWarsArray = [hanImage, chewyImage, lukeImage, anakinImage]
        
    }
    
 
    func setGestures() {
        
        let outletArray = [kirkImage, mccoyImage, spockImage, uhuruImage, hanImage, chewyImage, lukeImage, anakinImage]
        
        for image in outletArray {
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(anakinSucks))
            
            tapGesture.numberOfTapsRequired = 1
            
            image?.addGestureRecognizer(tapGesture)
        }
        
    }
    
    
    func anakinSucks(_ sender: UITapGestureRecognizer) {
        
        let image = sender.view as! UIImageView
        
        image.layer.borderWidth = 5
        image.layer.borderColor = UIColor.green.cgColor
        
        
        if starTrekArray.contains(image) {
            starTrekCharacter = image
        }
        if starWarsArray.contains(image) {
            starWarsCharacter = image
        }
        
        
        if starTrekCharacter != nil && starWarsCharacter != nil {
            performSegue(withIdentifier: "segueToDetail", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! FightViewController
        dest.starTrekCharacter.image = self.starTrekCharacter.image
        dest.starWarsCharacter.image = self.starWarsCharacter.image
        
        print("Goodbye World")
    }
    
    
    
    
}











