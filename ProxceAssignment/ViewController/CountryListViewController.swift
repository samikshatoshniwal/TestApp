//
//  CountryListViewController.swift
//  ProxceAssignment
//
//  Created by Samiksha on 22/03/18.
//  Copyright © 2018 Samiksha. All rights reserved.
//

import UIKit
import CoreLocation

class CountryListViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var identityView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var coordinatesLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var email: String?
    var localCoordiantes: CLLocationCoordinate2D?
    let locationManager = CLLocationManager()
    var spinner: UIActivityIndicatorView = UIActivityIndicatorView()
    var countryListArray: [Country] = [Country]()
    
    class func fromStoryboard() -> CountryListViewController {
        let countryListViewController = UIStoryboard (name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: CountryListViewController.self)) as! CountryListViewController
        return countryListViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .denied:
                locationServicesDenied()
            case .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
                displayData()
            default: break
            }
        }
    }
    
    func setupLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 100
        locationManager.delegate = self
    }
    
    func setupView() {
        setupNavigationBar()
        setupAppearance()
        setupTableView()
        fetchCountryData()
    }
    
    func setupNavigationBar() {
        title = "Information"
    }
    
    func setupTableView() {
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
    }
    
    func locationServicesDenied() {
        showAlert(withTitle: "Allow access your location while you use the app?", message: "That allows fetching your location for services to the app", cancelButtonTitle: "Cancel", otherButtonTitle: "Go To Settings", cancelButtonPostHandler: {[unowned self] in
            self.navigationController?.popViewController(animated: true)
            }, otherButtonPostHandler: {
                UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: nil)
        })
    }
    
    func displayData() {
        emailLabel.text = "Hello \(String(describing: email!))"
        guard localCoordiantes != nil else {
            coordinatesLabel.text = ""
            return
        }
        coordinatesLabel.text = "Your co-ordinates are \(String(describing: (localCoordiantes?.latitude)!)) as latitude and \(String(describing: (localCoordiantes?.longitude)!)) as longitude."
    }
    
    //    MARK: private methods
    
    fileprivate func startSpinner() {
        spinner.center = view.center
        spinner.hidesWhenStopped = true
        spinner.activityIndicatorViewStyle = .gray
        view.addSubview(spinner)
        spinner.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    fileprivate func stopSpinner() {
        spinner.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    //    MARK: web service methods
    
    func fetchCountryData() {
        startSpinner()
        UnAuthenticatedRestAPIService.shared.getCountryData { [weak self] (success, error, responseArray) in
            self?.stopSpinner()
            if responseArray != nil, responseArray?.count != 0 {
                self?.countryListArray = responseArray!
                self?.tableView.isHidden = false
                self?.tableView.reloadData()
            } else {
                self?.showAlert(withTitle: "Please try again later!", message: nil)
            }
        }
    }
    
    //    MARK: appearance methods
    
    func setupAppearance() {
        setupColor()
        setupFontFamily()
    }
    
    func setupColor() {
        identityView.backgroundColor = UIColor(red: 238/255, green: 245/255, blue: 254/255, alpha: 1.0)
        emailLabel.textColor = UIColor.darkGray
        coordinatesLabel.textColor = UIColor.darkGray
    }
    
    func setupFontFamily() {
        emailLabel.font = UIFont.systemFont(ofSize: 12)
        coordinatesLabel.font = UIFont.systemFont(ofSize: 12)
    }
}

//  MARK: CLLocationManagerDelegate methods

extension CountryListViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coords: CLLocationCoordinate2D = manager.location?.coordinate else {
            return
        }
        localCoordiantes = coords
        displayData()
    }
}

//  MARK: UITableViewDataSource methods

extension CountryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryListTableViewCell.identifier()) as! CountryListTableViewCell
        cell.setupCountryCell(withCountry: countryListArray[indexPath.row])
        return cell
    }
}

//  MARK: UITableViewDelegate methods

extension CountryListViewController: UITableViewDelegate {
    
}
