//
//  ViewController.swift
//  Changing A Text Style
//
//  Created by Vladislav Tarasevich on 07.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var subheadlineLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()

        NotificationCenter.default.addObserver(self, selector: #selector(didChangePreferredFont(_:)), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }

    @objc
    private func didChangePreferredFont(_ notification: Notification) {
        configureView()
    }

    private func configureView() {
        subheadlineLabel.font = UIFont.italicFont(forTextStyle: .subheadline)
    }

}

extension UIFont {

    static func italicFont(forTextStyle style: UIFont.TextStyle) -> UIFont? {
        let preferredDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)

        guard let descriptor = preferredDescriptor.withSymbolicTraits(.traitItalic) else {
            return nil
        }
        return UIFont(descriptor: descriptor, size: 0)
    }

}

