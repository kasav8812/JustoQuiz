//
//  JustoMainViewController.swift
//  quizJusto
//
//  Created by Charls Salazar on 26/01/22.
//

import UIKit

class JustoMainViewController: UIViewController {
    @IBOutlet weak var mProfilesTableView: UITableView!
    var presenter: Justo_ViewToPresenter?
    var mJustoProfilesDataSource : JustoProfilesDataSource!
    let mRefreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        createTableViewProfiles()
        presenter?.consumingJustoAPI(mUrl: "https://randomuser.me/api/")
    }
    
    func createTableViewProfiles(){
        mRefreshControl.attributedTitle = NSAttributedString(string: "Justo Profiles")
        mRefreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        mJustoProfilesDataSource = JustoProfilesDataSource(tableView: mProfilesTableView, mViewController: self)
        mProfilesTableView.dataSource = mJustoProfilesDataSource
        mProfilesTableView.delegate = mJustoProfilesDataSource
        mProfilesTableView.addSubview(mRefreshControl)
        mProfilesTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Justo Profile"
    }


    @objc func refresh(_ sender: AnyObject) {
        presenter?.consumingJustoAPI(mUrl: "https://randomuser.me/api/")
        mRefreshControl.endRefreshing()
    }

}

extension JustoMainViewController : Justo_PresenterToView{
    func showInfoProfile(mResponse: JustoModelProfile) {
        mJustoProfilesDataSource.update(items: mResponse.results!)
    }
    
}
