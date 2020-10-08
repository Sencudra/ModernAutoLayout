//
//  ScaledFont.swift
//  Using A Custom Font
//
//  Created by Vladislav Tarasevich on 08.10.2020.
//

import UIKit

public struct ScaledFont {

    // MARK: - Private types

    private typealias StyleDictionary = [UIFont.TextStyle.RawValue: FontDescription]

    private struct FontDescription: Decodable {
        let fontSize: CGFloat
        let fontName: String
    }

    // MARK: - Private properties

    private var styleDictionary: StyleDictionary?

    // MARK: - Public init

    public init(fontName: String, in bundle: Bundle = Bundle.main) {
        if let url = bundle.url(forResource: fontName, withExtension: "plist"), let data = try? Data(contentsOf: url) {
            let decoder = PropertyListDecoder()
            styleDictionary = try? decoder.decode(StyleDictionary.self, from: data)
        }
    }

    public func font(forTextStyle textStyle: UIFont.TextStyle) -> UIFont {
        guard let fontDescription = styleDictionary?[textStyle.rawValue],
              let font = UIFont(name: fontDescription.fontName, size: fontDescription.fontSize) else {
            return UIFont.preferredFont(forTextStyle: textStyle)
        }

        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        return fontMetrics.scaledFont(for: font)
    }

}
