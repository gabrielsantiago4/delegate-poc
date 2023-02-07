//
//  ChangeLabelView.swift
//  delegate-poc
//
//  Created by Gabriel Santiago on 03/02/23.
//

import UIKit

class ChangeLabelView: UIView {

    weak var delegate: ChangeLabelDelegate?
    var didTapOnButtonHandler: (() -> Void)?

    lazy var textField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "digite seu texto aqui"
        return textfield
    }()

    lazy var saveButton: UIButton = {
        let saveButton = UIButton()
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Salvar", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(ChangeLabelView.saveButtonAction), for: .touchUpInside)
        return saveButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func saveButtonAction() {
        if let textInput = textField.text {
            delegate?.changeLabel(newLabel: textInput)
        }
        didTapOnButtonHandler?()
    }
}

extension ChangeLabelView: ViewCoding {
    func setupHiearchy() {
        addSubview(textField)
        addSubview(saveButton)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 200),

            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor, constant: 80)
        ])
    }
    func configureView() {
        backgroundColor = .white
    }
}
