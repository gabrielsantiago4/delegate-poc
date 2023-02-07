//
//  ViewCoding.swift
//  delegate-poc
//
//  Created by Gabriel Santiago on 03/02/23.
//

import Foundation

protocol ViewCoding {

    func setupHiearchy()
    func setupConstraints()
    func configureView()

}

extension ViewCoding {
    
    func buildView() {
        setupHiearchy()
        setupConstraints()
        configureView()
    }
}
