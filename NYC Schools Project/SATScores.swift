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
        self.mathSATScore.text = mathScores
        self.writingSATScore.text = writingScores
        self.readingSATScore.text = readingScores
        
      //  print(mathScores)
       // print(writingScores)
       // print(readingScores)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var mathSATScore: UILabel = {
        let label = UILabel()
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
        
        NSLayoutConstraint.activate([
      
        
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUpUI()
    }
}
