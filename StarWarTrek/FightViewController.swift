//
//  FightViewController.swift
//  StarWarTrek
//
//  Created by Benjamin Su on 10/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FightViewController: UIViewController {

    @IBOutlet weak var starTrek: UIImageView!
    
    @IBOutlet weak var starWars: UIImageView!
    
    
    @IBAction func resetButton(_ sender: UIButton) {
    }
    
    
    
    var starTrekCharacter = UIImageView()
    var starWarsCharacter = UIImageView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello Neil")
        starTrek.image = starTrekCharacter.image
        starWars.image = starWarsCharacter.image
        setGestures()
    }
    
    func setGestures() {
        
        let trekPan = UIPanGestureRecognizer(target: self, action: #selector(panMeBabyOneMoreTime))
        starTrek.addGestureRecognizer(trekPan)
        
        let warPan = UIPanGestureRecognizer(target: self, action: #selector(panMeBabyOneMoreTime))
        starWars.addGestureRecognizer(warPan)
        
    }
    
    func panMeBabyOneMoreTime(sender: UIPanGestureRecognizer) {
        print(sender.location(in: self.view))
        let view = sender.view as! UIImageView
       
        view.center = sender.location(in: self.view)
        
        let otherView = view == starTrek ? starWars : starTrek 
        
        if starTrek.frame.contains(starWars.frame) {
            self.view.backgroundColor = UIColor.gray
        }
        
        if view.frame.intersects(otherView!.frame) {
            self.view.backgroundColor = UIColor.gray
        }
        
    }


}








