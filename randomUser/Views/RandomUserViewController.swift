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
    init(viewModel: String) {
        //self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Properties
    //let viewModel:
    
    // MARK: - UI Setup
    func setupUI() {
        configureSubViews()
        configureStackViews()
        configureConstraints()
    }
    
    func configureSubViews() {}
    
    func configureStackViews() {}
    
    func configureConstraints() {}
    
    //MARK: - Actions
}

