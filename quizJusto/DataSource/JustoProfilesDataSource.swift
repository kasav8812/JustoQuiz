//
//  JustoProfilesDataSource.swift
//  quizJusto
//
//  Created by Charls Salazar on 27/01/22.
//

import UIKit

class JustoProfilesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var mProfilesArray : [Results] = []
    var tableView : UITableView?
    var mReferenceItem : String = "ItemProfileJustoTableViewCell"
    var mViewController: UIViewController!

    init(tableView: UITableView, mViewController : UIViewController) {
        super.init()
        self.tableView = tableView
        self.mViewController = mViewController
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.separatorStyle = .none
        let nib = UINib(nibName: mReferenceItem, bundle: nil)
        self.tableView?.register(nib, forCellReuseIdentifier: mReferenceItem)
    }
    
    func update(items: [Results]) {
        self.mProfilesArray = items
        self.tableView?.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 930
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mProfilesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.mProfilesArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: mReferenceItem, for: indexPath) as! ItemProfileJustoTableViewCell
        cell.mLocationButton.tag = indexPath.row
        cell.mLocationButton.addTarget(self, action: #selector(loadMap), for: .touchUpInside)
        cell.mProfileImageView.downloaded(from: item.picture?.large ?? "")
        cell.mNameProfileLabel.text =  "\(item.name?.title ?? "") \(item.name?.first ?? "") \(item.name?.last ?? "")"
        cell.mEmailLabel.text = item.email ?? ""
        
        cell.mStreetLabel.text = "\(item.location?.street?.name ?? "") \(item.location?.street?.number ?? 0)"
        cell.mCityLabel.text = item.location?.city ?? ""
        cell.mStateCountryLabel.text = "\(item.location?.state ?? "") \(item.location?.country ?? "")"
        cell.mPostcodeLabel.text = "\(item.location?.postcode ?? 0)"
        cell.mCoordinatesLabel.text = "\(item.location?.coordinates?.latitude ?? "") \(item.location?.coordinates?.longitude ?? "")"
        
        cell.mUUidLabel.text = item.login?.uuid ?? ""
        cell.mUserNameLabel.text = item.login?.username  ?? ""
        cell.mPasswordLabel.text = item.login?.password ?? ""
        cell.mSaltLabel.text = item.login?.salt ?? ""
        cell.mMd5Label.text = item.login?.md5 ?? ""
        cell.mSha1Label.text = item.login?.sha1 ?? ""
        
        cell.mPhone.text = item.phone ?? ""
        cell.mCell.text = item.cell ?? ""
        return cell
    }
    
    @objc func loadMap(_ sender : UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "MapLocation", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "MapLocationViewController") as! MapLocationViewController
        view.mLatitude = Double(self.mProfilesArray[sender.tag].location?.coordinates?.latitude ?? "0.0") ?? 0.0
        view.mLongitude = Double(self.mProfilesArray[sender.tag].location?.coordinates?.longitude ?? "0.0") ?? 0.0
        mViewController.navigationController?.pushViewController(view, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
