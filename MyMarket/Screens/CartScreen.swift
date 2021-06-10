//
//  CartScreen.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/25/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class CartScreen: UIViewController {
    
    enum  Section {case main}
    let tableView = UITableView()
    
    var searching = false
    
    var products: [ProductItem] = []
    var filterArray: [ProductItem] = []
    
    var dataSource: UITableViewDiffableDataSource<Section , ProductItem>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        configureSearchController()
        getProducts()
        configureDataSource()
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        tableView.allowsSelection = false
        tableView.rowHeight = 110
        tableView.frame = view.bounds
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.reuseId)
    }
    
    func configureSearchController(){
        let searchController                     = UISearchController()
        searchController.searchResultsUpdater    = self
        searchController.searchBar.delegate      = self
        searchController.searchBar.placeholder   = "Search For Product."
        navigationItem.searchController          = searchController
    }
    
    func getProducts(){
        showProgressIndicator()
        NetworkManager.shared.getProduct { [weak self] result in
            guard let self = self else{return}
            self.dismissIndicator()
            switch result {
            case .success(let products) :
                self.products.append(contentsOf: products)
                self.updateData(on: products)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Oooops", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func configureDataSource(){
        dataSource = UITableViewDiffableDataSource<Section,ProductItem>(tableView: tableView, cellProvider: { (tableView, indexPath, prod) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.reuseId) as! CartTableViewCell
            cell.set(products: prod)
            return cell
        })
    }
    
    func updateData(on products: [ProductItem]){
        var snapshot = NSDiffableDataSourceSnapshot<Section , ProductItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(products)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}

extension CartScreen: UISearchResultsUpdating , UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text , !filter.isEmpty else{ return }
        searching        = true
        filterArray      = products.filter{$0.title.lowercased().contains(filter.lowercased())}
        updateData(on: filterArray)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching  = false
        updateData(on: products)
    }
}
