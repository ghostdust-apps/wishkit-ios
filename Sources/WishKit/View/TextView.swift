//
//  TextView.swift
//  wishkit-ios
//
//  Created by Martin Lasek on 2/9/23.
//  Copyright © 2023 Martin Lasek. All rights reserved.
//

import UIKit

protocol TextViewDelegate {
    func deleteBackward(textField: TextView)
}

final class TextView: UITextView {

    var textFieldDelegate: TextViewDelegate?

    init(padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)) {
        super.init(frame: .zero, textContainer: nil)

        layer.cornerRadius = 12
        layer.cornerCurve = .continuous
        backgroundColor = .systemGray
        contentInset = padding
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func deleteBackward() {
        if let textFieldDelegate = self.textFieldDelegate {
            textFieldDelegate.deleteBackward(textField: self)
        }

        super.deleteBackward()
    }
}