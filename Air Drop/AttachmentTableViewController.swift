//
//  AttachmentTableViewController.swift
//  Air Drop
//
//  Created by Kanat A on 20/06/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

class AttachmentTableViewController: UITableViewController {

    let filenames = ["camera-photo-tips.html", "foggy.jpg", "Hello World.ppt", "no more complaint.png", "Just Dev.doc"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filenames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = filenames[indexPath.row]
        cell.imageView?.image = UIImage(named: "icon\(indexPath.row).png");
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let fileURL = fileToURL(filenames[indexPath.row]) {
            
            let activityContoller = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
            present(activityContoller, animated: true, completion: nil)
        }
    }

    
    func fileToURL(_ file: String) -> URL? {
        let fileComponents = file.components(separatedBy: ".")
        
        if let filePath = Bundle.main.path(forResource: fileComponents[0], ofType: fileComponents[1]) {
            return URL(fileURLWithPath: filePath)
        }
        
        return nil
    }
    

}














