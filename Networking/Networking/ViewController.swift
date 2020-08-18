//
//  ViewController.swift
//  Networking
//
//  Created by Ariel Congestri on 18/08/2020.
//  Copyright © 2020 Congestri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // This dependecy shold be a protocol
    let presenter = PresenterExample()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getJoke()
    }

}

