//
//  UITableViewCell.swift
//  NYC Schools Project
//
//  Created by Jaleel Gilbert on 9/5/23.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    static let ID = "CustomTableViewCell"
    
    private lazy var highSchoolNames: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(labelText: String) {
        self.highSchoolNames.text = labelText
    }
    
    private func setUpUI() {
        self.contentView.addSubview(self.highSchoolNames)
    
        self.highSchoolNames.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
        
            highSchoolNames.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            highSchoolNames.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            highSchoolNames.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            highSchoolNames.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
            
        ])
    }
}
