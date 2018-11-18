//
//  ViewController.swift
//  set
//
//  Created by Anthony Mackay on 11/11/18.
//  Copyright © 2018 Anthony Mackay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var setGame = SetGame()

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func touchNewGameButton(_ sender: UIButton) {
        print("Touched NG button!")
    }
    
    @IBAction func touchDrawThreeCardsButton(_ sender: UIButton) {
        print("Touched D3C button!")
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        print("Touched card.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

