//
//  Veriff.swift
//  Veriff
//
//  Created by Kseniya Zharikova on 2/8/22.
//

import Foundation
import UIKit

public enum Veriff {
    public typealias SDK = VeriffSDK
    public typealias Delegate = VeriffSDKDelegate
}

public protocol VeriffSDK {
    func start(from viewController: UIViewController)
    var delegate: Veriff.Delegate? { get set }
}

public protocol VeriffSDKDelegate {
    func didFinish(results: Veriff.Results)
}

extension Veriff {
    public struct Results: Equatable {
        var faceRecognitionResult: Result<UIImage,ErrorReason>
        var textRecognitionResult: Result<[String],ErrorReason>
    }
}
