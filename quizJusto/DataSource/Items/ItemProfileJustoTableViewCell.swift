//
//  ItemProfileJustoTableViewCell.swift
//  quizJusto
//
//  Created by Charls Salazar on 27/01/22.
//

import UIKit

class ItemProfileJustoTableViewCell: UITableViewCell {
    @IBOutlet weak var mProfileImageView: UIImageView!
    @IBOutlet weak var mEmailLabel: UILabel!
    @IBOutlet weak var mNameProfileLabel: UILabel!
    @IBOutlet weak var mStreetLabel: UILabel!
    @IBOutlet weak var mCityLabel: UILabel!
    @IBOutlet weak var mStateCountryLabel: UILabel!
    @IBOutlet weak var mPostcodeLabel: UILabel!
    @IBOutlet weak var mCoordinatesLabel: UILabel!
    @IBOutlet weak var mUUidLabel: UILabel!
    @IBOutlet weak var mUserNameLabel: UILabel!
    @IBOutlet weak var mPasswordLabel: UILabel!
    @IBOutlet weak var mSaltLabel: UILabel!
    @IBOutlet weak var mMd5Label: UILabel!
    @IBOutlet weak var mSha1Label: UILabel!
    @IBOutlet weak var mPhone: UILabel!
    @IBOutlet weak var mCell: UILabel!
    @IBOutlet weak var mLocationButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
