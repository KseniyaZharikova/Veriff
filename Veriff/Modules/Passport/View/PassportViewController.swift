//
//  PassportViewController.swift
//  Veriff
//
//  Created by Kseniya Zharikova on 27/7/22.
//

import Foundation
import UIKit

final class PassportViewController: UIViewController {

    var presenter: PassportPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        navigationItem.title = "Step 2"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = .gray
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(descriptionLabel.snp.top).offset(-10)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
        }
        
        takePhotoButton.snp.makeConstraints {
            $0.height.equalTo(54)
            $0.left.right.equalToSuperview().inset(32)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
        }
    }
    
    // MARK: - Actions
    
    @objc func takePhotoAction(_ sender: Any) {
        openCamera(delegate: self)
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "To finish with verification we need a photo of your document"
        view.addSubview(label)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Please take a photo of the front side of your ID-card. Make sure it is clearly visible."
        view.addSubview(label)
        return label
    }()
    
    private lazy var takePhotoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Take a photo", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(takePhotoAction(_:)), for: .allEvents)
        view.addSubview(button)
        return button
    }()
}

extension PassportViewController: PickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        presenter.takedPhotoAction(image: info[.originalImage] as? UIImage)
    }
}

extension PassportViewController: PassportView {}
