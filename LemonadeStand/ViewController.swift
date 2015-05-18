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
    
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    var lemonsToMix = 0
    var iceCubesToMix = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateMainView()
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
    
    // Helper functions
    func updateMainView() {
        moneySupplyCount.text = "$\(supplies.money)"
        lemonSupplyCount.text = "\(supplies.lemons) Lemons"
        iceCubeSupplyCount.text = "\(supplies.iceCubes) Ice Cubes"
        
        lemonPurchaseCount.text = "\(lemonsToPurchase)"
        iceCubePurchaseCount.text = "\(iceCubesToPurchase)"
        
        lemonMixCount.text = "\(lemonsToMix)"
        iceCubeMixCount.text = "\(iceCubesToMix)"
    }
    
    func showAlertWithText( header: String = "Warning", message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
}

