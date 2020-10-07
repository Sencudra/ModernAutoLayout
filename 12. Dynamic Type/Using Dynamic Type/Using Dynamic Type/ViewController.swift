//
//  ViewController.swift
//  Using Dynamic Type
//
//  Created by Vladislav Tarasevich on 07.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        textView.textContainer.lineFragmentPadding = 0
    }


}

