//
//  PassportPresenterImpl.swift
//  Veriff
//
//  Created by Kseniya Zharikova on 27/7/22.
//

import Foundation
import UIKit

protocol PassportView: AnyObject {}

protocol PassportPresenter: AnyObject {
    func takedPhotoAction(image: UIImage?)
}

final class PassportPresenterImpl: PassportPresenter {
   private let view: PassportView
   private var coordinator: Coordinator?
   private let detector: Detector
    
    required init(view: PassportView, detector: Detector, coordinator: Coordinator) {
        self.view = view
        self.coordinator = coordinator
        self.detector = detector
    }
    
    func takedPhotoAction(image: UIImage?) {
        guard let image = image else { return }
        
        detector.detectText(image: image, { [weak self] result in
            guard let self = self else { return }
            self.coordinator?.didFinishDocumentRecognition(result: result)
        })
    }
}
