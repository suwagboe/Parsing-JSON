//
//  ViewController.swift
//  Parsing-JSON-Using-Bundle
//
//  Created by Pursuit on 8/3/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Section  {
        case main // tableview only has one section
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    typealias DataSource = UITableViewDiffableDataSource<Section, President>
    // both section identifier and the ItemIdentifier needs to conform to hashable protocol 
    private var dataSource: DataSource!
    // needed to add hashable to the model
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        fectchPresidents()
    }

    private func configureDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { (tableView, indexPath, president) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = president.name
            cell.detailTextLabel?.text = president.number.description
            return cell
        })
        // setUpInitialSnapshot
           var snapshot = NSDiffableDataSourceSnapshot<Section, President>()
        snapshot.appendSections([(.main)])
           dataSource.apply(snapshot, animatingDifferences: false)

    }
   
    private func fectchPresidents() {
        var presidents: [President] = []
        do {
            presidents = try Bundle.main.parsingJSON(with: "presidents")
            
        } catch {
            print("error: \(error)")
            // Todo: An alert
        }
        
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(presidents, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

