//
//  SATScores.swift
//  NYC Schools Project
//
//  Created by Jaleel Gilbert on 9/5/23.
//

import Foundation
import UIKit

class SATScoresView: UIViewController {
    
    
 
    init(mathScores: String, writingScores: String, readingScores: String) {
        self.mathSATScore.text = "SAT Scores, Math: \(mathScores), Writing: \(writingScores), Reading: \(readingScores)"
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var mathSATScore: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private var readingSATScore: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var writingSATScore: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private func setUpUI() {
        self.view.addSubview(mathSATScore)
        self.view.addSubview(readingSATScore)
        self.view.addSubview(writingSATScore)
        
        self.mathSATScore.translatesAutoresizingMaskIntoConstraints = false
     
        
        NSLayoutConstraint.activate([
      
            self.mathSATScore.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            self.mathSATScore.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 20),
            self.mathSATScore.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.mathSATScore.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20),
            
            
         
            
            
        
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUpUI()
    }
}
