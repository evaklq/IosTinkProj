//
//  LabelFactoryMethod.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import UIKit

final class LabelFactoryMethod: LabelFactoryMethodProtocol {
    func createLabel(text: String?, size: Int?, type: LabelType) -> UILabel {
        switch type {
        case .default:
            createDefaultLabel(text, size)
        case .title:
            createTitleLabel(text, size)
        case .error:
            createErrorLabel()
        }
    }
}

private extension LabelFactoryMethod {
    func createDefaultLabel(_ text: String?, _ size: Int?) -> UILabel {
        let color = Asset.Colors.general.color
        let label: UILabel
        if let size = size {
            label = createBaseLabel(text, color, size: size)
        } else {
            label = createBaseLabel(text, color)
        }

        return label
    }

    func createTitleLabel(_ text: String?, _ size: Int? = 20) -> UILabel {
        let color = Asset.Colors.general.color
        let label = createBaseLabel(text, color, weight: .bold, size: size ?? 20)

        return label
    }

    func createErrorLabel() -> UILabel {
        let color = Asset.Colors.error.color
        let label = createBaseLabel(nil, color, size: 14)
        label.isHidden = true

        return label
    }

    func createBaseLabel(_ text: String?, _ color: UIColor, weight: UIFont.Weight = .regular, size: Int = 16) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)
        label.textColor = color
        label.text = text

        return label
    }
}
