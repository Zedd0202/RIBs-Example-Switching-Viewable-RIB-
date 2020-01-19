//
//  WalkerRouter.swift
//  RIBs Example (Switching Viewable RIB)
//
//  Created by Zedd on 2020/01/19.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs

protocol WalkerInteractable: Interactable {
    var router: WalkerRouting? { get set }
    var listener: WalkerListener? { get set }
}

protocol WalkerViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class WalkerRouter: ViewableRouter<WalkerInteractable, WalkerViewControllable>, WalkerRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: WalkerInteractable, viewController: WalkerViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
