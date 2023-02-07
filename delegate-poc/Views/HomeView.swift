//
//  HomeView.swift
//  delegate-poc
//
//  Created by Gabriel Santiago on 02/02/23.
//

import UIKit

class HomeView: UIView {

    var didTapOnButtonHandler: (() -> Void)?

    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "texto"
        label.textColor = .black
        label.font = label.font.withSize(30)
        return label
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemGray6, for: .normal)
        button.setTitle("Mude o Texto da Label!", for: .normal)
        button.configuration = .borderedProminent()
        button.addTarget(self, action: #selector(HomeView.buttonAction), for: .touchUpInside)
        return button
    }()

    var labelFrame: UIView = {
        let frame = UIView()
        frame.translatesAutoresizingMaskIntoConstraints = false
        frame.backgroundColor = .systemGray4
        frame.layer.cornerRadius = 15
        frame.layer.masksToBounds = true
        return frame
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonAction() {
        didTapOnButtonHandler?()
    }
}

extension HomeView: ViewCoding {

    func setupHiearchy() {
        addSubview(labelFrame)
        addSubview(label)
        addSubview(button)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -70),

            button.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            button.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 100),

            labelFrame.topAnchor.constraint(equalTo: label.topAnchor, constant: -20),
            labelFrame.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            labelFrame.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: -15),
            labelFrame.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 15)
        ])
    }
    func configureView() {
        backgroundColor = .white
    }
}
