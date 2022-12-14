//
//  SelfiePresenterImpl.swift
//  Veriff
//
//  Created by Kseniya Zharikova on 25/7/22.
//

import Foundation
import UIKit

protocol SelfieView: AnyObject {}

protocol SelfiePresenter: AnyObject {
    func takedPhotoAction(image: UIImage?)
}

final class SelfiePresenterImpl: SelfiePresenter {
   
   private let view: SelfieView
   private var coordinator: Coordinator?
   private let detector: Detector
    
    required init(view: SelfieView, detector: Detector, coordinator: Coordinator) {
        self.view = view
        self.coordinator = coordinator
        self.detector = detector
    }
    
    func takedPhotoAction(image: UIImage?) {
        guard let image = image else { return }
        
        detector.detectFace(image: image, { [weak self] result in
            guard let self = self else { return }
            self.coordinator?.didFinishFaceRecognition(result: result)
        })
    }
}
