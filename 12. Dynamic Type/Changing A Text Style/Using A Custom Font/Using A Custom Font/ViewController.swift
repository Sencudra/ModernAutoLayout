//
//  ViewController.swift
//  Using A Custom Font
//
//  Created by Vladislav Tarasevich on 08.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var chapterLabel: UILabel!
    @IBOutlet var bodyTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let scaledFont = ScaledFont(fontName: "SansitaSwashed")
        bodyTextView.textContainer.lineFragmentPadding = 0
        titleLabel.font = scaledFont.font(forTextStyle: .title1)
        authorLabel.font = scaledFont.font(forTextStyle: .subheadline)
        chapterLabel.font = scaledFont.font(forTextStyle: .headline)
        bodyTextView.font = scaledFont.font(forTextStyle: .body)
    }

}
