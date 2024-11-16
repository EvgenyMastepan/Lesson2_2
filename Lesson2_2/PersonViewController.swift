//
//  PersonViewController.swift
//  Lesson2_2
//
//  Created by Evgeny Mastepan on 16.11.2024.
//

import UIKit

class PersonViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let buttonAction: UIAction = UIAction { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }
        
        let leftIndent: CGFloat = 30
        let widthOf = view.frame.width - leftIndent - leftIndent
        //===== Incoming Data =====
        let name: String = "Анастасия"
        let surname: String = "Нифонтова"
        let age = ageSuffix(for: 25)
        //=========================
        
        let appName = ourLabel(text: "Tinderamba",
            place: CGRect(x: leftIndent,
                          y: 63,
                          width: widthOf,
                          height: 36),
                          fontSize: 30, fontColour: .black, bold: true)
        view.addSubview(appName)
        let photoImage = ourImage(name: "chiks",
            place: CGRect(x: leftIndent,
                          y: appName.frame.maxY + leftIndent,
                          width: widthOf,
                          height: widthOf))
        view.addSubview(photoImage)
        let nameLabel = attachmentLabel(text: name + " " + surname,
             place: CGRect(x: photoImage.frame.minX + leftIndent,
                           y: photoImage.frame.maxY - 103,
                           width: photoImage.frame.maxX - leftIndent,
                           height: 24),
             fontSize: 20, fontColour: .white, bold: true)
        view.addSubview(nameLabel)
        let ageLabel = ourLabel(text: age,
             place: CGRect(x: photoImage.frame.minX + leftIndent,
                           y: nameLabel.frame.maxY,
                           width: photoImage.frame.width - leftIndent - leftIndent,
                           height: 19),
             fontSize: 16, fontColour: .white)
        view.addSubview(ageLabel)
        let crossButton  = roundButton(name: "multiply",
            place: CGRect(x: leftIndent,
                          y: photoImage.frame.maxY + leftIndent,
                          width: 65,
                          height: 65),
                          color: .black)
        view.addSubview(crossButton)
        let heartButton  = roundButton(name: "heart.fill",
            place: CGRect(x: view.frame.maxX - leftIndent - 65,
                          y: photoImage.frame.maxY + leftIndent,
                          width: 65,
                          height: 65),
                          color: .red)
        view.addSubview(heartButton)
        let letsWriteButton = ourButton(text: "Написать",
            place: CGRect(x: crossButton.frame.maxX + 10,
                          y: crossButton.frame.minY + crossButton.frame.height / 2 - 25,
                          width: view.frame.width - 2 * (crossButton.frame.maxX + 10),
                          height: 50),
                          action: buttonAction)
        view.addSubview(letsWriteButton)
    }
    
    private func ourImage(name: String, place: CGRect) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: name)
        image.frame = place
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }
    private func attachmentLabel(text: String, place: CGRect, fontSize: CGFloat, fontColour: UIColor, bold: Bool = false) -> UILabel {
        let label = UILabel()
        let image = UIImage(named: "sertificate")
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: -5, width: 29, height: 29)
        let attributedString = NSMutableAttributedString(string: text)
        let imageString = NSAttributedString(attachment: attachment)
        attributedString.append(imageString)
        label.attributedText = attributedString
        label.textColor = fontColour
        label.numberOfLines = 1
        label.frame = place
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .heavy)
        return label
    }
    private func ourLabel(text: String, place: CGRect, fontSize: CGFloat, fontColour: UIColor, bold: Bool = false) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = fontColour
        label.numberOfLines = 1
        label.sizeToFit()
//      Отладочный параметр
//      label.backgroundColor = .yellow
        label.frame = place
        if bold { label.font = UIFont.systemFont(ofSize: fontSize, weight: .heavy) }
           else { label.font = UIFont.systemFont(ofSize: fontSize) }
        return label
    }
    private func roundButton(name: String, place: CGRect, color: UIColor) -> UIButton {
        let roundButton = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(
            pointSize: 32, weight: .bold, scale: .default)
        let image = UIImage(systemName: name, withConfiguration: config)
        roundButton.setImage(image, for: .normal)
        roundButton.tintColor = color
        roundButton.setTitleColor(.red, for: .normal)
        roundButton.frame = place
        roundButton.layer.cornerRadius = place.width / 2
        roundButton.clipsToBounds = true
        roundButton.backgroundColor = .systemGray6
        return roundButton
        }
    private func ourButton(text: String, place: CGRect, action: UIAction? = nil) -> UIButton {
        let button = UIButton()
        if let action = action {
               button.addAction(action, for: .touchUpInside)
        }
        button.setTitle(text, for: .normal)
        button.backgroundColor = .systemGreen
        button.frame = place
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }
    private func ageSuffix(for age: Int) -> String {
        let lastDigit = age % 10
        let lastTwoDigits = age % 100

        if lastDigit == 1 && lastTwoDigits != 11 {
            return "\(age) год"
        } else if (lastDigit == 2 || lastDigit == 3 || lastDigit == 4) && (lastTwoDigits < 12 || lastTwoDigits > 14) {
            return "\(age) года"
        } else {
            return "\(age) лет"
        }
    }
    
//====================================================================================
// Попытка сделать картинку UIImage с закругленными краями и внутренней тенью.
    
//    private func ourImage(name: String, place: CGRect) -> UIImageView {
//        let originalImage = UIImage(named: name)
//        let image = UIImage.roundedImageWithShadow(image: originalImage!,
//                                                   cornerRadius: 40,
//                                                   shadowColor: .black,
//                                                   shadowOpacity: 0,
//                                                   shadowOffset: CGSize(width: 0, height: 5),
//                                                   shadowRadius: 10)
//        let imageView = UIImageView()
//        imageView.image = image
//        imageView.frame = place
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }

}
//
//extension UIImage {
//    static func roundedImageWithShadow(image: UIImage, cornerRadius: CGFloat, shadowColor: UIColor, shadowOpacity: Float, shadowOffset: CGSize, shadowRadius: CGFloat) -> UIImage? {
//        let rect = CGRect(origin: .zero, size: image.size)
//        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
//        guard let context = UIGraphicsGetCurrentContext() else { return nil }
//        context.setShadow(offset: shadowOffset, blur: shadowRadius, color: shadowColor.cgColor)
//        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
//        context.addPath(path.cgPath)
//        context.clip()
//        image.draw(in: rect)
//        let roundedImageWithShadow = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return roundedImageWithShadow
//    }
//}
