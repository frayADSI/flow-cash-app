//
//  ViewControllerStyles.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/3/20.
//

import Foundation
import UIKit

extension UIView {
    // MARK: - Inspectables
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
}
extension UIViewController {


    func getViewController(name: String) -> UIViewController {
        if let vc = storyboard?.instantiateViewController(identifier: name) {
                return vc
        } else {
                return UIViewController()
        }
    }
    
    func goToViewcontroller(name: String, title: String) {
        if let vc = storyboard?.instantiateViewController(identifier: name) {
            vc.navigationItem.title = title
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func setNav(icon: UIImage?, target: Any?, action: Selector?, color: UIColor = .white) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: icon, style: .plain, target: target, action: action)
    }
    
    func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func backAction() {
        self.goBack()
    }
    
    func showAlert(title: String, message: String) {
        let alertOption = UIAlertAction(title: "OK", style: .default)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(alertOption)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UITableView {
    
    //This method allow to register cells ONLY of the
    //.xib and the cell class has the same name
    
    func registerCell(named: String) {
        let identifier = named
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}
