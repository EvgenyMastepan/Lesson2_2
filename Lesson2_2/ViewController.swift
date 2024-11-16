//
//  ViewController.swift
//  Lesson2_2
//
//  Created by Evgeny Mastepan on 16.11.2024.
//

import UIKit

class ViewController: UIViewController {
    private var descriptionTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonAction: UIAction = UIAction { [weak self] _ in
            self?.descriptionTextView.text = "Indian Larry (born Lawrence DeSmedt; April 28, 1949 – August 30, 2004) was an American motorcycle builder and artist, stunt rider, and biker. He first became known as Indian Larry in the 1980s when he was riding the streets of New York City on a chopped Indian motorcycle. Respected as an old school chopper builder, Larry sought greater acceptance of choppers being looked upon as an art form. He became interested in hot rods and motorcycles at an early age and was a fan of Von Dutch and Ed \"Big Daddy\" Roth, whom he would later meet in California."
        }
        
        let transitionAction: UIAction = UIAction { [weak self] _ in
            let personViewController = PersonViewController()
            self?.present(personViewController, animated: true, completion: nil)
        }
        
        let leftIndent: CGFloat = 30
        let widthOf = view.frame.width - leftIndent - leftIndent
        
        //===== Incoming Data =====
        let name: String = "Indian"
        let surname: String = "Larry"
        //=========================
        
        // Картинки
        let topImage = ourImage(name: "darkness",
            place: CGRect(x: 0,
                          y: 0,
                          width: view.frame.width,
                          height: round(view.frame.height / 6)))
        view.addSubview(topImage)
        let personImage = ourImage(name: "indian",
            place: CGRect(x: leftIndent,
                          y: topImage.frame.maxY + leftIndent,
                          width: 100,
                          height: 100),  round: true)
        view.addSubview(personImage)
        
        // Текст
        let nameLabel = ourLabel(text: name + " " + surname,
            place: CGRect(x: personImage.frame.maxX + 20,
                          y: personImage.frame.minY + 20,
                          width: view.frame.maxX - personImage.frame.maxX - 20 - leftIndent,
                          height: 19), bold: true)
        view.addSubview(nameLabel)
        let addSubscriptionLabel = ourLabel(text: "Добавить описание",
            place: CGRect(x: leftIndent,
                          y: personImage.frame.maxY + 50,
                          width: widthOf,
                          height: 19))
        view.addSubview(addSubscriptionLabel)
        descriptionTextView = ourTextView(
            place: CGRect(x: leftIndent,
                          y: addSubscriptionLabel.frame.maxY + 10,
                          width: widthOf,
                          height: 150))
        view.addSubview(descriptionTextView)
        let changePasswordLabel = ourLabel(text: "Изменить пароль",
            place: CGRect(x: leftIndent,
                          y: descriptionTextView.frame.maxY + 30,
                          width: widthOf,
                          height: 19))
        view.addSubview(changePasswordLabel)
        let oldPasswordField = ourTextField(text: "Старый пароль",
            place: CGRect(x: leftIndent,
                          y: changePasswordLabel.frame.maxY + 20,
                          width: widthOf,
                          height: 52))
        view.addSubview(oldPasswordField)
        let newPasswordField = ourTextField(text: "Новый пароль",
            place: CGRect(x: leftIndent,
                          y: oldPasswordField.frame.maxY + 20,
                          width: widthOf,
                          height: 52))
        view.addSubview(newPasswordField)

        // Кнопки
        //Выровнял кнопку "редактировать" по правому краю. Чтобы сделать, как на превью, достаточно в поле width значение заменить на 147.
        let editButton = ourButton(text: "редактировать",
            place: CGRect(x: personImage.frame.maxX + 20, y: nameLabel.frame.maxY + 10, width: view.frame.maxX - personImage.frame.maxX - 20 - leftIndent, height: 34), action: transitionAction)
        view.addSubview(editButton)
        let saveButton = ourButton(text: "Сохранить", place: CGRect(x: leftIndent, y: view.frame.maxY - 105, width: widthOf, height: 55), action: buttonAction)
        view.addSubview(saveButton)
    }

    private func ourImage(name: String, place: CGRect, round: Bool = false) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: name)
        image.frame = place
        image.contentMode = .scaleAspectFill
        if round { image.layer.cornerRadius = image.frame.size.width / 2 }
        image.clipsToBounds = true
        return image
    }
    private func ourLabel(text: String, place: CGRect, bold: Bool = false) -> UILabel {
        let label = UILabel()
        label.text = text
//      Отладочный параметр
//      label.backgroundColor = .yellow
        label.frame = place
        if bold { label.font = UIFont.systemFont(ofSize: 16, weight: .heavy) }
           else { label.font = UIFont.systemFont(ofSize: 16) }
        return label
    }
    private func ourButton(text: String, place: CGRect, action: UIAction? = nil) -> UIButton {
        let button = UIButton()
        if let action = action {
               button.addAction(action, for: .touchUpInside)
        }
        button.setTitle(text, for: .normal)
        button.backgroundColor = .blue
        button.frame = place
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }
    private func ourTextField(text: String, place: CGRect) -> UITextField {
        let textField = UITextField()
        textField.placeholder = text
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.backgroundColor = .systemGray6
        textField.frame = place
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.frame = place
        return textField
    }
    private func ourTextView(place: CGRect) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.backgroundColor = .systemGray6
        textView.textColor = .black
        textView.frame = place
        textView.layer.cornerRadius = 20
        textView.layer.masksToBounds = true
        textView.textContainer.lineFragmentPadding = 10
        return textView
    }
    
    
}

