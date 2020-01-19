//
//  WalkerInteractor.swift
//  RIBs Example (Switching Viewable RIB)
//
//  Created by Zedd on 2020/01/19.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs
import RxSwift

protocol WalkerRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol WalkerPresentable: Presentable {
    var listener: WalkerPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol WalkerListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func didMoveToZedd()
}

final class WalkerInteractor: PresentableInteractor<WalkerPresentable>, WalkerInteractable, WalkerPresentableListener {
    
    weak var router: WalkerRouting?
    weak var listener: WalkerListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: WalkerPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func moveToZedd() {
        self.listener?.didMoveToZedd()
    }
}
