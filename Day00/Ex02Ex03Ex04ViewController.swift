//
//  Ex02Ex03Ex04ViewController.swift
//  Day00
//
//  Created by Anastasiia VEREMIICHYK on 4/1/19.
//  Copyright © 2019 Anastasiia VEREMIICHYK. All rights reserved.
//

import UIKit

class Ex02Ex03Ex04ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var One: UIButton!
    @IBOutlet weak var Two: UIButton!
    @IBOutlet weak var Three: UIButton!
    @IBOutlet weak var Four: UIButton!
    @IBOutlet weak var Five: UIButton!
    @IBOutlet weak var Six: UIButton!
    @IBOutlet weak var Seven: UIButton!
    @IBOutlet weak var Eight: UIButton!
    @IBOutlet weak var Nine: UIButton!
    @IBOutlet weak var Zero: UIButton!
    @IBOutlet weak var ac: UIButton!
    @IBOutlet weak var neg: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var multiple: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var result: UIButton!
    
    var res : Double = 0
    var numOnScreen : Double = 0
    var numBeforeAction : Double = 0
    var actn : Int = 0
    var clearLabel: Bool = true
    var isNegative: Bool = false
    
    @IBAction func numberPressed(_ sender: UIButton) {
        print("The button \(String(sender.tag)) was pressed")
        if (clearLabel) {
            label.text = String(sender.tag)
            numOnScreen = Double(label.text!)!
            res = numOnScreen
            clearLabel = false
        } else {
            label.text = label.text! + String(sender.tag)
            numOnScreen = Double(label.text!)!
            res = numOnScreen
        }
    }
    
    func calculatePreviousResult() {
        clearLabel = true
        if actn == 12 {
            res = numBeforeAction + numOnScreen
            numBeforeAction = res
        } else if actn == 14 {
            res = numBeforeAction - numOnScreen
            numBeforeAction = res
        } else if actn == 13 {
            res = numBeforeAction * numOnScreen
            numBeforeAction = res
        } else if actn == 15 {
            res = numBeforeAction / numOnScreen
            numBeforeAction = res
        } else if actn == 0 {
            res = numOnScreen
            numBeforeAction = res
        }
    }
    
    @IBAction func negActionPressed(_ sender: UIButton) {
        print("The button NEG (sign change) was pressed")
        numOnScreen = numOnScreen * (-1)
        let last2 = String(numOnScreen).suffix(2)
        if last2 == ".0" {
            label.text = String(Int(numOnScreen))
        } else {
            label.text = String(numOnScreen)
        }
        res = numOnScreen
    }
    
    @IBAction func acPressed(_ sender: UIButton) {
        print("The button AC (reset) was pressed")
        res = 0
        numOnScreen = 0
        numBeforeAction = 0
        actn = 0
        clearLabel = true
        isNegative = false
    }
    
    @IBAction func actionPressed(_ sender: UIButton) {
        calculatePreviousResult()
        numBeforeAction = res
        if (sender.tag == 12) {
            print("The button + was pressed")
            actn = sender.tag
        } else if (sender.tag == 13) {
            print("The button * was pressed")
            actn = sender.tag
        } else if (sender.tag == 14) {
            print("The button - was pressed")
            actn = sender.tag
        } else if (sender.tag == 15) {
            print("The button / was pressed")
            actn = sender.tag
        }
        print("number before action: \(numBeforeAction)")
        print("number on screen: \(numOnScreen)")
        print("result: \(res)")
        
        let last2 = String(res).suffix(2)
        if last2 == ".0" {
            label.text = String(Int(res))
        } else {
            label.text = String(res)
        }
    }
    
    @IBAction func printResult(_ sender: UIButton) {
        print("The button = was pressed")
        calculatePreviousResult()
        let last2 = String(res).suffix(2)
        if last2 == ".0" {
            label.text = String(Int(res))
        } else {
            label.text = String(res)
        }
        numOnScreen = res
        
        actn = 16
    }
}
