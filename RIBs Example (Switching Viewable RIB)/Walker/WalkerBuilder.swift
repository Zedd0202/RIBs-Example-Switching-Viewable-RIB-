//
//  WalkerBuilder.swift
//  RIBs Example (Switching Viewable RIB)
//
//  Created by Zedd on 2020/01/19.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs

protocol WalkerDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class WalkerComponent: Component<WalkerDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol WalkerBuildable: Buildable {
    func build(withListener listener: WalkerListener) -> WalkerRouting
}

final class WalkerBuilder: Builder<WalkerDependency>, WalkerBuildable {

    override init(dependency: WalkerDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: WalkerListener) -> WalkerRouting {
        let component = WalkerComponent(dependency: dependency)
        let viewController = WalkerViewController()
        let interactor = WalkerInteractor(presenter: viewController)
        interactor.listener = listener
        return WalkerRouter(interactor: interactor, viewController: viewController)
    }
}
