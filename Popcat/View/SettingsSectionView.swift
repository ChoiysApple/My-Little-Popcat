//
//  SettingsSectionView.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/06/14.
//

import Foundation

//MARK: - header view
public func tableViewSectionHeaderView(description: String) -> UIView {
    let descriptionLabel = UILabel()
    descriptionLabel.font = UIFont(name: "AvenirNext-medium", size: 28)
    descriptionLabel.text = description
    descriptionLabel.textAlignment = .left
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

    let contentView = UIView()
    
    contentView.addSubview(descriptionLabel)
    descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
    descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
    descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
    descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    
    return contentView
}

//MARK: footer view
public func tableViewSectionFooterView(description: String) -> UIView {
    let descriptionLabel = UILabel()
    descriptionLabel.font = UIFont(name: "AvenirNext-regular", size: 15.0)
    descriptionLabel.textColor = .systemGray
    descriptionLabel.text = description
    descriptionLabel.textAlignment = .left
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

    let contentView = UIView()
    contentView.addSubview(descriptionLabel)
    descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
    descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
    descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
    
    return contentView
}
