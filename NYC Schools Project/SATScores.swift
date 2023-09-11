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
    
    private var writingScore: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private var mathScore: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private var readingScore: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private var schoolTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private func setUpUI() {
        self.view.addSubview(writingScore)
        self.view.addSubview(mathScore)
        self.view.addSubview(readingScore)
        self.view.addSubview(schoolTitle)
        
        self.writingScore.translatesAutoresizingMaskIntoConstraints = false
        self.mathScore.translatesAutoresizingMaskIntoConstraints = false
        self.readingScore.translatesAutoresizingMaskIntoConstraints = false
        self.schoolTitle.translatesAutoresizingMaskIntoConstraints = false
     
        
        NSLayoutConstraint.activate([
      
            self.schoolTitle.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.schoolTitle.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: 10),
            
            self.writingScore.topAnchor.constraint(equalTo: schoolTitle.bottomAnchor, constant: 50),
            self.writingScore.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: 30),
            
            self.mathScore.topAnchor.constraint(equalTo: writingScore.bottomAnchor, constant: 20),
            self.mathScore.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 30),
            
            self.readingScore.topAnchor.constraint(equalTo: mathScore.bottomAnchor, constant: 20),
            self.readingScore.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 30)
            
            
            
        ])
    }
    
    
    private func makeRequest() async {
        await viewModel.getSchoolSATData(dbnId: data.dbn) { [weak self] result in
            if result {
                guard let self = self else { return }

                for data in self.viewModel.schoolsData {
                    DispatchQueue.main.async {
                        self.schoolTitle.text = data.schoolName
                        
                        self.writingScore.text = "SAT Average Writing Score: \(data.satWritingAvgScore)"
                        
                        self.mathScore.text = "SAT Average Math Score: \(data.satMathAvgScore)"
                        
                        self.readingScore.text = "SAT Average Reading Score: \(data.satCriticalReadingAvgScore)"
                        
                     
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
