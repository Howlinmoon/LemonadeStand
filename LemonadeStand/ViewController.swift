//
//  ViewController.swift
//  LemonadeStand
//
//  Created by jim Veneskey on 5/15/15.
//  Copyright (c) 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // IBOutlets (labels) from the UI
    @IBOutlet weak var moneySupplyCount: UILabel!
    @IBOutlet weak var lemonSupplyCount: UILabel!
    @IBOutlet weak var iceCubeSupplyCount: UILabel!
    @IBOutlet weak var lemonPurchaseCount: UILabel!
    @IBOutlet weak var iceCubePurchaseCount: UILabel!
    @IBOutlet weak var lemonMixCount: UILabel!
    @IBOutlet weak var iceCubeMixCount: UILabel!
    
    // initially $10, 1 lemon, 1 ice cube (adjustable)
    var supplies = Supplies(aMoney: 10, aLemons: 1, aIceCubes: 1)
    // setup our pricing - non-adjustable
    let price = Price()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // IBActions (Buttons) from the UI
    
    @IBAction func purchaseLemonButtonPressed(sender: UIButton) {
    }
    
    @IBAction func purchaseIceCubeButtonPressed(sender: UIButton) {
    }
    
    @IBAction func unpurchaseLemonButtonPressed(sender: UIButton) {
    }

    @IBAction func unpurchaseIceCubeButtonPressed(sender: UIButton) {
    }
    
    @IBAction func mixLemonButtonPressed(sender: UIButton) {
    }
    @IBAction func mixIceCubeButtonPressed(sender: UIButton) {
    }
   
    @IBAction func unmixLemonButtonPressed(sender: UIButton) {
    }
    
    @IBAction func unMixIceCubeButtonPressed(sender: UIButton) {
    }

    
    @IBAction func startDayButtonPressed(sender: UIButton) {
    }
    
    
    
}

