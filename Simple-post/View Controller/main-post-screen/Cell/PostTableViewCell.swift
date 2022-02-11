//
//  PostTableViewCell.swift
//  Simple-post
//
//  Created by BOICOMP21070027 on 10/2/2565 BE.
//

import UIKit
import Kingfisher

class PostTableViewCell: UITableViewCell {
    var viewModel:Post?
    var postIndex:Int?
    var delegate:PostDelegate?
    @IBOutlet weak var postTimeLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var userLogoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        //setdate()
    }
    
    func setdate() {
        userLogoImageView.makeRounded()

        if let setdata = viewModel {
            userLogoImageView.kf.indicatorType = .activity
            userLogoImageView.kf.setImage(with: URL(string: setdata.user.imageUrl))
            userNameLabel.text = setdata.user.name
            postTimeLabel.text = setdata.time
            postDescriptionLabel.text = setdata.description
            postImageView.kf.indicatorType = .activity
            postImageView.kf.setImage(with:URL(string: setdata.postImage[0]),completionHandler: { [self]
                result in
                    switch result {
                    case .success(let value):
                        postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: value.image.size.height/value.image.size.width).isActive = true
                        delegate?.updateUI(index: postIndex!)
                        // The image was set to image view:
                    case .failure(let error):
                        print(error) // The error happens
                    }
            })
        }
    }
    @IBAction func likeButtonClick(_ sender: Any) {
        if let postData = viewModel {
            delegate?.popupAlert(data: postData,fromButton: "Like")
        }
    }
    
    @IBAction func commentButtonClick(_ sender: Any) {
        if let postData = viewModel {
            delegate?.popupAlert(data: postData,fromButton: "Comment")
        }
    }
    
    @IBAction func shareBottonClick(_ sender: Any) {
        if let postData = viewModel {
            delegate?.popupAlert(data: postData,fromButton: "Share")
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
