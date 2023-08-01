//
//  ViewController.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 27/07/23.
//

import UIKit
import SDWebImage
import RxSwift
import RxCocoa

class RandomUserViewController: UIViewController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setBindings()
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
    private let disposeBag = DisposeBag()
    
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
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var telephoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var locationButton: UIButton = {
        let button = UIButton()
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
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    // MARK: - UI Setup
    func setupUI() {
        configureSubViews()
        configureStackViews()
        configureConstraints()
        
        view.backgroundColor = .white
    }
    
    func configureSubViews() {
        view.addSubview(userStackView)
        view.addSubview(fetchButton)
        view.addSubview(activityIndicator)
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
        
        let activityIndicatorConstraints = [
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(userStackViewConstraints +
                                    userImageViewConstraints +
                                    fetchButtonConstraints +
                                    activityIndicatorConstraints)
    }
    
    func setBindings() {
        viewModel.randomUser
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] user in
                self?.updateUI(with: user)
            })
            .disposed(by: disposeBag)
        
        viewModel.isLoading
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] isLoading in
                if isLoading {
                    self?.activityIndicator.startAnimating()
                    self?.userStackView.isHidden = true
                    self?.fetchButton.isEnabled = false
                } else {
                    self?.activityIndicator.stopAnimating()
                    self?.userStackView.isHidden = false
                    self?.fetchButton.isEnabled = true
                }
            })
            .disposed(by: disposeBag)
        
        fetchButton.rx.tap
            .bind(onNext: { [weak self] in
                self?.viewModel.fetchRandomUser()
            })
            .disposed(by: disposeBag)
    }
    
    private func updateUI(with user: RandomUser?) {
        if let user = user {
            nameLabel.text = "\(user.name.title) \(user.name.first) \(user.name.last)"
            locationButton.setTitle("\(user.location.city), \(user.location.state) - \(user.location.country)", for: .normal)
            telephoneLabel.text = user.cell
            
            if let imageURL = URL(string: user.picture.medium) {
                userImageView.sd_setImage(with: imageURL,
                                          placeholderImage: UIImage(systemName: "person.crop.square"))
            }
        }
    }
    
    //MARK: - Actions
    @objc func openMaps() {
        viewModel.randomUser
            .take(1)
            .subscribe(onNext: { [weak self] randomUser in
                guard let coordinates = randomUser?.location.coordinates else {
                    return
                }
                self?.coordinator?.coordinateToMaps(coordinates: coordinates)
            })
            .disposed(by: disposeBag)
    }
}

