//
//  ViewController.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 27/07/23.
//

import UIKit
import SDWebImage

class RandomUserViewController: UIViewController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        view.backgroundColor = .white
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
    var coordinator: RandomUserCoordinator?
    
    private lazy var userStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
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
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Santiaog Gonzaga"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var telephoneLabel: UILabel = {
        let label = UILabel()
        label.text = "55 51 994824554"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var locationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Porto Alegre, RS - Brazil", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(openMaps), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var fetchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Fetch Another Random User", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(fetchButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - UI Setup
    func setupUI() {
        configureSubViews()
        configureStackViews()
        configureConstraints()
    }
    
    func configureSubViews() {
        view.addSubview(userStackView)
        view.addSubview(fetchButton)
    }
    
    func configureStackViews() {
        userStackView.addArrangedSubview(userImageView)
        userStackView.addArrangedSubview(nameLabel)
        userStackView.addArrangedSubview(telephoneLabel)
        userStackView.addArrangedSubview(locationButton)
    }
    
    func configureConstraints() {
        let userStackViewConstraints = [
            userStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ]
        
        let userImageViewConstraints = [
            userImageView.heightAnchor.constraint(equalToConstant: 120),
            userImageView.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let fetchButtonConstraints = [
            fetchButton.heightAnchor.constraint(equalToConstant: 40),
            fetchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fetchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fetchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            fetchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48)
        ]
        
        NSLayoutConstraint.activate(userStackViewConstraints +
                                    userImageViewConstraints +
                                    fetchButtonConstraints)
    }
    
    //MARK: - Actions
    @objc func openMaps() {
        coordinator?.coordinateToMaps()
    }
    
    @objc func fetchButtonTapped() {
        print("Not implement yet")
    }
}

