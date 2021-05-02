//
//  CategoriesScreen.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/25/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class CategoriesScreen: UIViewController {
    
    let tableView     = UITableView()
    var imagesArray   = Images()
    let reuseId = "TableViewCell"
    var rowWithImages: [CollectionViewCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
    }
    
    func configureTableView(){
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseId)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension CategoriesScreen: UITableViewDelegate,UITableViewDataSource,CollectionViewCellDelegate{
    func collectionView(collectionviewcell: CollectionViewCell?, index: Int, didTappedInTableViewCell: TableViewCell) {
        let descVC   = DescriptionScreen()
        let dataVM   = didTappedInTableViewCell.rowWithImages[index]
        descVC.title = dataVM.name
        descVC.imageView.image     = dataVM.image
        descVC.secondaryLabel.text = dataVM.bio
        descVC.titleLabel.text     = "\(dataVM.prise)LE  per Kg"
        descVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(descVC, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return imagesArray.objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // Category Title
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemBackground
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 0, width: 200, height: 44))
        headerView.addSubview(titleLabel)
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.text = imagesArray.objectsArray[section].category
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId) as! TableViewCell
        // Show Category Title
        let imageName = imagesArray.objectsArray[indexPath.section].category
        cell.titleLabel.text = imageName
        // Pass the data to colletionview inside the tableviewcell
        let rowArray = imagesArray.objectsArray[indexPath.section].images
        cell.cellDelegate = self
        cell.updateCellWith(row: rowArray)
        return cell
    }
}
