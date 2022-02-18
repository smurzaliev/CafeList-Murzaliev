//
//  CafeCollectionViewCell.swift
//  CafeList-Murzaliev
//
//  Created by Samat Murzaliev on 15.02.2022.
//

import UIKit
import SnapKit

class CafeCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Создание элементов кастомной ячейки
    
    private var screenLayout: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    var cafeLogo: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var minPrice: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.textColor = .black
        view.textAlignment = .center
        return view
    }()
    
    override func layoutSubviews() {
        setSubViews()
    }
    
    private func setSubViews() {
        
        addSubview(screenLayout)
        screenLayout.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        screenLayout.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        screenLayout.addSubview(cafeLogo)
        cafeLogo.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(90)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-10)
        }
        
        screenLayout.addSubview(minPrice)
        minPrice.snp.makeConstraints { make in
            make.height.equalTo(15)
            make.width.equalToSuperview()
            make.top.equalTo(cafeLogo.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        }
        
    }
}
