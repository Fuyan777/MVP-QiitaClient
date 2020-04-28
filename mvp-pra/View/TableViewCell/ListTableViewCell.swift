//
//  ListTableViewCell.swift
//  mvp-pra
//
//  Created by 山田楓也 on 2020/04/13.
//  Copyright © 2020 Fuuya Yamada. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView! {
        didSet {
            userImageView.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var listBackgroundView: UIView! {
        didSet {
            listBackgroundView.layer.cornerRadius = 10
            listBackgroundView.layer.shadowOpacity = 0.3
            listBackgroundView.layer.shadowRadius = 3
            listBackgroundView.layer.shadowColor = UIColor.black.cgColor
            listBackgroundView.layer.shadowOffset = CGSize(width: 3, height: 3)
        }
    }
    
    func draw(article: InfoModel) {
        titleLabel.text = article.title
        userImageView.image = UIImage(url: article.user.profile_image_url)
        if article.user.description == "" {
            descriptionLabel.isHidden = true
        } else {
            descriptionLabel.text = article.user.description
        }
    }
}

extension UIImage {
    public convenience init(url: String) {
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}
