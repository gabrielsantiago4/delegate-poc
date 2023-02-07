//
//  ChangeLabelViewController.swift
//  delegate-poc
//
//  Created by Gabriel Santiago on 03/02/23.
//

import UIKit

class ChangeLabelViewController: UIViewController {

    var changeLabelView = ChangeLabelView()

    override func loadView() {
        view = changeLabelView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        changeLabelView.didTapOnButtonHandler = {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    

}
