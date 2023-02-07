//
//  ViewController.swift
//  delegate-poc
//
//  Created by Gabriel Santiago on 02/02/23.
//

import UIKit

class HomeViewController: UIViewController {

    var homeView = HomeView ()
    var changeLabelViewController = ChangeLabelViewController()
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        changeLabelViewController.changeLabelView.delegate = self
        homeView.didTapOnButtonHandler = {[weak self] in
            if let nextViewController = self?.changeLabelViewController {
                self?.navigationController?.pushViewController(nextViewController, animated: true)
            }
        }

    }
}

extension HomeViewController: ChangeLabelDelegate {
    func changeLabel(newLabel: String) {
        homeView.label.text = newLabel
    }




}


