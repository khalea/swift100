//
//  DetailViewController.swift
//  Project1
//
//  Created by Khalea Berry on 11/16/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var outOf: (Int, Int) = (0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Image \(outOf.0 + 1) of \(outOf.1)"
        view.insetsLayoutMarginsFromSafeArea = false
        navigationItem.largeTitleDisplayMode = .never
        
        // Check if selectedImage exists and unwrap, then load if it does
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
