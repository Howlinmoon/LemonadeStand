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
    
    var weatherArray:[[Int]] = [[-10, -9, -5, -7], [5, 8, 10, 9], [22, 25, 27, 23]]
    var weatherToday:[Int] = [0, 0, 0, 0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        simulateWeatherToday()
        updateMainView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // IBActions (Buttons) from the UI
    
    @IBAction func purchaseLemonButtonPressed(sender: UIButton) {
        if supplies.money >= price.lemon {
            lemonsToPurchase += 1
            supplies.money -= price.lemon
            supplies.lemons += 1
            updateMainView()
        } else {
            showAlertWithText(message: "You don't have enough money!")
        }
    }
    
    @IBAction func purchaseIceCubeButtonPressed(sender: UIButton) {
        if supplies.money >= price.iceCube {
            iceCubesToPurchase += 1
            supplies.money -= price.iceCube
            supplies.iceCubes += 1
            updateMainView()
        } else {
            showAlertWithText(message: "You don't have enough money!")
        }
    }
    
    @IBAction func unpurchaseLemonButtonPressed(sender: UIButton) {
        if lemonsToPurchase > 0 {
            lemonsToPurchase -= 1
            supplies.money += price.lemon
            supplies.lemons -= 1
            updateMainView()
        } else {
            showAlertWithText(message: "You don't have any to return!")
        }
        
    }

    @IBAction func unpurchaseIceCubeButtonPressed(sender: UIButton) {
        if iceCubesToPurchase > 0 {
            iceCubesToPurchase -= 1
            supplies.money += price.iceCube
            supplies.iceCubes -= 1
            updateMainView()
        } else {
            showAlertWithText(message: "You don't have any to return!")
        }
        
    }
    
    @IBAction func mixLemonButtonPressed(sender: UIButton) {
        if supplies.lemons > 0 {
            lemonsToPurchase = 0
            supplies.lemons -= 1
            lemonsToMix += 1
            updateMainView()
        } else {
            showAlertWithText(message: "You don't have enough inventory!")
        }
    }
    
    @IBAction func mixIceCubeButtonPressed(sender: UIButton) {
        if supplies.iceCubes > 0 {
            iceCubesToPurchase = 0
            supplies.iceCubes -= 1
            iceCubesToMix += 1
            updateMainView()
        } else {
            showAlertWithText(message: "You don't have enough inventory!")
        }
    }
   
    @IBAction func unmixLemonButtonPressed(sender: UIButton) {
        if lemonsToMix > 0 {
            lemonsToPurchase = 0
            lemonsToMix -= 1
            supplies.lemons += 1
            updateMainView()
        } else {
            showAlertWithText(message: "You don't have any to unmix!")
        }
    }
    
    @IBAction func unMixIceCubeButtonPressed(sender: UIButton) {
        if iceCubesToMix > 0 {
            iceCubesToPurchase = 0
            iceCubesToMix -= 1
            supplies.iceCubes += 1
            updateMainView()
        } else {
            showAlertWithText(message: "You don't have any to unmix!")
        }
    }

    
    @IBAction func startDayButtonPressed(sender: UIButton) {
        
        let customers = Int(arc4random_uniform(UInt32(11)))
        println("Generated \(customers) random customers")
        
        if lemonsToMix == 0 || iceCubesToMix == 0 {
            // invalid mix
            showAlertWithText(message: "You need to add at least 1 Lemon and 1 Ice Cube")
        } else {
            // valid mix
            let lemonadeRatio = Double(lemonsToMix) / Double(iceCubesToMix)
            
            for x in 0...customers {
                println("Working on customer number \(x)")
                let preference = Double(arc4random_uniform(UInt32(101)))/100
                println("Customer preference: \(preference)")
                println("Lemonade Ratio: \(lemonadeRatio)")
                
                if preference < 0.4 && lemonadeRatio > 1 {
                    supplies.money += 1
                    println("Paid #1")
                } else if preference >= 0.4 && preference <= 0.6 && lemonadeRatio == 1 {
                    supplies.money += 1
                    println("Paid #2")
                } else if preference > 0.6 && lemonadeRatio < 1 {
                    supplies.money += 1
                    println("Paid #3")
                } else {
                    println("Did not get paid")
                }
                
            }
            
            lemonsToPurchase = 0
            iceCubesToPurchase = 0
            lemonsToMix = 0
            iceCubesToMix = 0
            
            simulateWeatherToday()
            updateMainView()
            
        }
        
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
    
    func simulateWeatherToday () {
        let index = Int(arc4random_uniform(UInt32(weatherArray.count)))
        weatherToday = weatherArray[index]
        
    }
    
}

