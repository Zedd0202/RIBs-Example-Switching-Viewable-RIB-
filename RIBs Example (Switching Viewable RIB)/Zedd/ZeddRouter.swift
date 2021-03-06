//
//  ZeddRouter.swift
//  RIBs Example (Switching Viewable RIB)
//
//  Created by Zedd on 2020/01/19.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs

protocol ZeddInteractable: Interactable {
    var router: ZeddRouting? { get set }
    var listener: ZeddListener? { get set }
}

protocol ZeddViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ZeddRouter: ViewableRouter<ZeddInteractable, ZeddViewControllable>, ZeddRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ZeddInteractable, viewController: ZeddViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
