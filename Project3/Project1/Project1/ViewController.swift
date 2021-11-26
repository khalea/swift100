//
//  ViewController.swift
//  Project1
//
//  Created by Khalea Berry on 11/11/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Image Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("pic") {
                pictures.append(item)
            }
        }
        pictures.sort()
        print(pictures)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        // Configure content & apply the template to the cell
        var content = cell.defaultContentConfiguration()
        content.text = pictures[indexPath.row]
        content.textProperties.font = UIFont(name: "Avenir Next Demi Bold", size: 24.0) ?? UIFont.systemFont(ofSize: 16.0)
        content.textProperties.color = UIColor.systemMint
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // If the storyboard exists & a row has been selected, create & push a detail view with the selected image if the navcontroller also exists
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.outOf = (indexPath.row, pictures.count)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    

}

