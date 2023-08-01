//
//  MapsViewController.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 31/07/23.
//

import UIKit
import MapKit

class MapsViewController: UIViewController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    //MARK: - Init
    init(viewModel: MapsViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Properties
    let viewModel: MapsViewModelProtocol
    var coordinator: MapsCoordinator?
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private lazy var closeButton: UIBarButtonItem = {
        let closeButton = UIBarButtonItem(title: "Close",
                                          style: .plain,
                                          target: self,
                                          action: #selector(dismissAction))
        return closeButton
    }()
    
    // MARK: - UI Setup
    func setupUI() {
        configureSubViews()
        configureConstraints()
        
        navigationItem.rightBarButtonItem = closeButton
        view.backgroundColor = .white
        title = "\(viewModel.latitude), \(viewModel.longitude)"
        
        let initialCoordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(viewModel.latitude),
                                                       longitude: CLLocationDegrees(viewModel.longitude))
        let region = MKCoordinateRegion(center: initialCoordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = initialCoordinate
        mapView.addAnnotation(annotation)
    }
    
    func configureSubViews() {
        view.addSubview(mapView)
    }
    
    func configureConstraints() {
        let mapViewConstrains = [
            mapView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(mapViewConstrains)
    }
    
    //MARK: - Actions
    @objc func dismissAction() {
        coordinator?.coordinateDismiss()
    }
}
