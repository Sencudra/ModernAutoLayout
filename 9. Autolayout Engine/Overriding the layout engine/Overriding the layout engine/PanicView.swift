//
//  PanicView.swift
//  Overriding the layout engine
//
//  Created by Vladislav Tarasevich on 04.10.2020.
//

import UIKit

final class PanicView: UIView {

    @IBOutlet private var notPannicButton: UIButton!
    @IBOutlet private var panicButton: UIButton!
    @IBOutlet private var stackView: UIStackView!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let minButtonWidth = max(notPannicButton.intrinsicContentSize.width, panicButton.intrinsicContentSize.width)
        let minHorizontalWidth = minButtonWidth * 2 + 16
        let marginWidth = layoutMarginsGuide.layoutFrame.width
        if minHorizontalWidth > marginWidth {
            stackView.axis = .vertical
        } else {
            stackView.axis = .horizontal
        }
    }

}
