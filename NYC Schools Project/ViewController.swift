//
//  ViewController.swift
//  NYC Schools Project
//
//  Created by Jaleel Gilbert on 9/5/23.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    
       let viewModel = SchoolsViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.ID)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private func setUpViews() {
        self.view.addSubview(self.tableView)
        // self.tableView.backgroundColor = .red
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        ])
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        
        Task {
            await viewModel.getData { result in
                if result {
                    self.tableView.reloadData()
                }
                
            }
        }
        
        
    }

}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.ID, for: indexPath) as? CustomTableViewCell else {
            fatalError("Could not deque cell")
        }
        
        let schoolName = viewModel.schoolsData[indexPath.row].schoolName
        cell.configure(labelText: schoolName)
        
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.schoolsData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let dataPoint = viewModel.schoolsData[indexPath.row]
      
        
        let vc = SATScoresView(mathScores: dataPoint.satMathAvgScore, writingScores: dataPoint.satWritingAvgScore, readingScores: dataPoint.satCriticalReadingAvgScore)
        
        self.navigationController?.pushViewController(vc, animated: true)
  
    }
 
    
}

