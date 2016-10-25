//
//  InfoCell.swift
//  Sample
//
//  Created by user on 2016/10/25.
//  Copyright © 2016年 uluru. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func setCell(data:(imageUrl: URL?, text: String)) {
        // イメージ設定.
        if let url = data.imageUrl {
            print("url = \(url.absoluteString)")
            
            let request = URLRequest(url: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main, completionHandler: { (response, data, error) in
                if let err = error {
                    print("error = \(err.localizedDescription)")
                }
                
                guard let imageData = data else {return}
                self.userImage.image = UIImage(data: imageData)
            })
            
            
//            do {
//                let imageData = try Data(contentsOf: url)
//                userImage.image = UIImage(data: imageData)
//            } catch let error {
//                print("error = \(error.localizedDescription)")
//            }
        }
        
        // テキスト設定.
        label.text = data.text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
