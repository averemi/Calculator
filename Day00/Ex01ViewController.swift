//
//  Ex01ViewController.swift
//  Day00
//
//  Created by Anastasiia VEREMIICHYK on 4/1/19.
//  Copyright © 2019 Anastasiia VEREMIICHYK. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    @IBAction func clickMeToLabel(_ sender: Any) {
        label.text = "Hello World !"
    }
}
