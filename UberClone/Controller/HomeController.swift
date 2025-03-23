//
//  HomeController.swift
//  UberClone
//
//  Created by Mac$hawn on 3/23/25.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import MapKit

class HomeController: UIViewController {
    //  MARK: - Properties
    
    private let mapView = MKMapView()
    
    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        //signOut()
        
    }
    
    //  MARK: - API
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                //let nav = UINavigationController
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)

            }
        } else {
            print("DEBUG: User id is \(Auth.auth().currentUser?.uid)")
            configureUI()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    //  MARK: - Selectors
    
    //  MARK: - Helper Functions
    
    func configureUI() {
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
}
