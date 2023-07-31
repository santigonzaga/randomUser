//
//  ViewController.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 27/07/23.
//

import UIKit

class RandomUserViewController: UIViewController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.view.backgroundColor = .gray
    }
    
    //MARK: - Init
    init(viewModel: RandomUserViewModelProtocol) {
        self.viewModel = viewModel
        viewModel.fetchRandomUser()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Properties
    let viewModel: RandomUserViewModelProtocol
    //weak var coordinator: RandomUserCoordinator
    
    private lazy var imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "person.crop.square")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        
        return imageView
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Santiaog Gonzaga"
        label.font = .systemFont(ofSize: 16)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var telephoneLabel: UILabel = {
        let label = UILabel()
        label.text = "55 51 994824554"
        label.font = .systemFont(ofSize: 16)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    // MARK: - UI Setup
    func setupUI() {
        configureSubViews()
        configureStackViews()
        configureConstraints()
    }
    
    func configureSubViews() {
        view.addSubview(imageStackView)
    }
    
    func configureStackViews() {
        imageStackView.addArrangedSubview(userImageView)
        imageStackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(telephoneLabel)
    }
    
    func configureConstraints() {
        let imageStackViewConstraints = [
            imageStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            imageStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]
        
        let userImageViewConstraints = [
            userImageView.heightAnchor.constraint(equalToConstant: 80),
            userImageView.widthAnchor.constraint(equalToConstant: 80)
        ]
        
        NSLayoutConstraint.activate(imageStackViewConstraints +
                                    userImageViewConstraints)
    }
    
    //MARK: - Actions
    @objc func openMaps() {
        
    }
}

