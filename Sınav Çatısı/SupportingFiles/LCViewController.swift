//
//  LCViewController.swift
//  YKS2024
//
//  Created by necip on 10.07.2023.
//

import UIKit

class LCViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.cornerRadius = 30
        DispatchQueue.main.asyncAfter(deadline: .now() + 3)
        
        
        
    }
}
