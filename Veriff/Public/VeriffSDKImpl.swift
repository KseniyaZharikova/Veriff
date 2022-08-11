//
//  VeriffSDKImpl.swift
//  Veriff
//
//  Created by Kseniya Zharikova on 11/8/22.
//

import Foundation
import UIKit

final class VeriffSDKImpl: Veriff.SDK {
    
    private var builder: Builder?
    private var coordinator: Coordinator?
    var delegate: Veriff.Delegate?
    
    public init(builder: Builder, coordinator: Coordinator) {
        self.builder = builder
        self.coordinator = coordinator
    }
    
    public func start(from viewController: UIViewController) {
        coordinator?.start(from: viewController, delegate: self)
    }
}

extension VeriffSDKImpl: VeriffCoordinatorDelegate {
    func didFinish(results: Veriff.Results) {
        delegate?.didFinish(results: results)
    }
}
