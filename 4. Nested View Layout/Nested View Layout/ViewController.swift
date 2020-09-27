//
//  ViewController.swift
//  Nested View Layout
//
//  Created by Vladislav Tarasevich on 27.09.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonXConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonXConstraint.constant = -100
    }

    @IBAction func buttonTapped(_ sender: Any) {
        buttonXConstraint.constant = 0
    }

}

