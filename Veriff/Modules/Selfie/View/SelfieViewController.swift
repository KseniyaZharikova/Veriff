//
//  SelfieViewController.swift
//  Veriff
//
//  Created by Kseniya Zharikova on 25/7/22.
//

import UIKit
import SnapKit

final class SelfieViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    lazy var takePhotoButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var presenter: SelfiePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        navigationItem.title = "Step 1"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = .lightGray
    }
    
    
    // MARK: - Actions
    
   @objc func takePhotoAction(_ sender: Any) {
        openCamera(delegate: self)
    }
}

extension SelfieViewController: PickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        presenter.takedPhotoAction(image: info[.originalImage] as? UIImage)
    }
}

extension SelfieViewController: SelfieView {}
