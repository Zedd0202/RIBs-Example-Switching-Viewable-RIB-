//
//  ZeddViewController.swift
//  RIBs Example (Switching Viewable RIB)
//
//  Created by Zedd on 2020/01/19.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol ZeddPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func moveToWalker()
}

final class ZeddViewController: UIViewController, ZeddPresentable, ZeddViewControllable {
    
    weak var listener: ZeddPresentableListener?
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle("move to Walker", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.button)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.button.addTarget(self, action: #selector(self.buttonDidTap), for: .touchUpInside)
    }
    
    @objc
    func buttonDidTap() {
        self.listener?.moveToWalker()
    }
}
