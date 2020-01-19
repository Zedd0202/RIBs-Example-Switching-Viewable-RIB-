//
//  RootRouter.swift
//  SceneDelegate + RIBs
//
//  Created by Zedd on 2020/01/14.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, ZeddListener, WalkerListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    // TODO: Constructor inject child builder protocols to allow building children.
    private let zeddBuilder: ZeddBuildable
    private let walkerBuilder: WalkerBuildable
    
    private var zedd: ViewableRouting?
    private var walker: ViewableRouting?
    
    
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         zeddBuilder: ZeddBuildable,
         walkerBuilder: WalkerBuildable) {
        self.zeddBuilder = zeddBuilder
        self.walkerBuilder = walkerBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        self.routeToZedd()
    }
    
    func routeToZedd() {
        if let walker = self.walker {
            self.detachChild(walker)
            self.viewController.dismiss(viewController: walker.viewControllable)
            self.walker = nil
        }
        let zedd = self.zeddBuilder.build(withListener: self.interactor)
        self.zedd = zedd
        self.attachChild(zedd)
        self.viewController.present(viewController: zedd.viewControllable)
    }
    
    func routeToWalker() {
        if let zedd = self.zedd {
            self.detachChild(zedd)
            self.viewController.dismiss(viewController: zedd.viewControllable)
            self.zedd = nil
        }
        let walker = self.walkerBuilder.build(withListener: self.interactor)
        self.walker = walker
        self.attachChild(walker)
        self.viewController.present(viewController: walker.viewControllable)
    }
}
