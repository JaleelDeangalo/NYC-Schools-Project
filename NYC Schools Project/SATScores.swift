//
//  SATScores.swift
//  NYC Schools Project
//
//  Created by Jaleel Gilbert on 9/5/23.
//

import Foundation
import UIKit

class SATScoresView: UIViewController {
    
    
    private let data: Schools
    private let viewModel: SchoolsViewModel
    
    init(schoolData: Schools, viewModel: SchoolsViewModel) {
        self.data = schoolData
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var SATScores: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private func setUpUI() {
        self.view.addSubview(SATScores)
        
        self.SATScores.translatesAutoresizingMaskIntoConstraints = false
     
        
        NSLayoutConstraint.activate([
      
            self.SATScores.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            self.SATScores.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 20),
            self.SATScores.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.SATScores.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20),
            
        ])
    }
    
    
    private func makeRequest() async {
        await viewModel.getSchoolSATData(dbnId: data.dbn) { [weak self] result in
            if result {
                guard let self = self else { return }

                for data in self.viewModel.schoolsData {
                    DispatchQueue.main.async {
                        self.SATScores.text = "SAT Scores, Math: \(data.satMathAvgScore), Writing: \(data.satWritingAvgScore), Reading: \(data.satCriticalReadingAvgScore)"
                    }
                  
                }
        
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setUpUI()
        
        Task {
           await makeRequest()
        }
        
       
    }
}
