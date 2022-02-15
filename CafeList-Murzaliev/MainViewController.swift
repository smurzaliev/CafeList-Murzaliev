//
//  ViewController.swift
//  CafeList-Murzaliev
//
//  Created by Samat Murzaliev on 15.02.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private var cafeList: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: flow)
        view.register(CafeCollectionViewCell.self, forCellWithReuseIdentifier: "CafeCollectionViewCell")
        view.allowsSelection = false
        view.backgroundView = UIImageView(image: UIImage(named: "background"))
      
        return view
    }()
    
    //MARK: - Создание коллекции кафе по заданной модели
    
    private var cafes: [CafeModel] = [
        CafeModel(cafeLogo: "logo1", minPrice: "от 240 сом за чел."),
        CafeModel(cafeLogo: "logo2", minPrice: "от 280 сом за чел."),
        CafeModel(cafeLogo: "logo3", minPrice: "от 300 сом за чел."),
        CafeModel(cafeLogo: "logo4", minPrice: "от 290 сом за чел."),
        CafeModel(cafeLogo: "logo5", minPrice: "от 240 сом за чел."),
        CafeModel(cafeLogo: "logo6", minPrice: "от 280 сом за чел."),
        CafeModel(cafeLogo: "logo7", minPrice: "от 300 сом за чел."),
        CafeModel(cafeLogo: "logo8", minPrice: "от 290 сом за чел."),
        CafeModel(cafeLogo: "logo1", minPrice: "от 240 сом за чел."),
        CafeModel(cafeLogo: "logo2", minPrice: "от 280 сом за чел."),
        CafeModel(cafeLogo: "logo3", minPrice: "от 300 сом за чел."),
        CafeModel(cafeLogo: "logo4", minPrice: "от 290 сом за чел."),
        CafeModel(cafeLogo: "logo5", minPrice: "от 240 сом за чел."),
        CafeModel(cafeLogo: "logo6", minPrice: "от 280 сом за чел."),
        CafeModel(cafeLogo: "logo7", minPrice: "от 300 сом за чел."),
        CafeModel(cafeLogo: "logo8", minPrice: "от 290 сом за чел."),
        CafeModel(cafeLogo: "logo1", minPrice: "от 240 сом за чел."),
        CafeModel(cafeLogo: "logo2", minPrice: "от 280 сом за чел."),
        CafeModel(cafeLogo: "logo3", minPrice: "от 300 сом за чел."),
        CafeModel(cafeLogo: "logo4", minPrice: "от 290 сом за чел."),
        CafeModel(cafeLogo: "logo5", minPrice: "от 240 сом за чел."),
        CafeModel(cafeLogo: "logo6", minPrice: "от 280 сом за чел."),
        CafeModel(cafeLogo: "logo7", minPrice: "от 300 сом за чел."),
        CafeModel(cafeLogo: "logo8", minPrice: "от 290 сом за чел."),
        CafeModel(cafeLogo: "logo1", minPrice: "от 240 сом за чел."),
        CafeModel(cafeLogo: "logo2", minPrice: "от 280 сом за чел."),
        CafeModel(cafeLogo: "logo3", minPrice: "от 300 сом за чел."),
        CafeModel(cafeLogo: "logo4", minPrice: "от 290 сом за чел."),
        CafeModel(cafeLogo: "logo5", minPrice: "от 240 сом за чел."),
        CafeModel(cafeLogo: "logo6", minPrice: "от 280 сом за чел."),
        CafeModel(cafeLogo: "logo7", minPrice: "от 300 сом за чел."),
        CafeModel(cafeLogo: "logo8", minPrice: "от 290 сом за чел.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
    }
    
    private func setViews() {
        
        view.addSubview(cafeList)
        cafeList.delegate = self
        cafeList.dataSource = self
        cafeList.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        //MARK: - Добавление элементов в NavigationBar
        
        let labelImage = UIImageView(image: UIImage(named: "Glovo_logo"))
        labelImage.contentMode = .scaleAspectFit
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold, scale: .large)

        let leftImage = UIImage(systemName: "heart", withConfiguration: largeConfig)
        let rightImage = UIImage(systemName: "arrowshape.turn.up.right", withConfiguration: largeConfig)
        let leftButton = UIButton(type: .system)
        leftButton.setImage(leftImage, for: .normal)
        let rightButton = UIButton(type: .system)
        rightButton.setImage(rightImage, for: .normal)
        
        navigationController?.navigationBar.addSubview(rightButton)
        rightButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(35)
            make.height.equalTo(30)

        }
        
        navigationController?.navigationBar.addSubview(leftButton)
        leftButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(35)
            make.height.equalTo(30)

        }
    
        navigationController?.navigationBar.addSubview(labelImage)
        labelImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            
        }
        
    }


}


//MARK: - Делегаты UICollectionView

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cafes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CafeCollectionViewCell", for: indexPath) as! CafeCollectionViewCell
        cell.cafeLogo.image = UIImage(named: cafes[index].cafeLogo)
        cell.minPrice.text = cafes[index].minPrice
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let index = indexPath.item + 1
        if index % 7 == 0 {
            return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 7)

        } else {
            return CGSize(width: UIScreen.main.bounds.height / 7, height: UIScreen.main.bounds.height / 7)

        }
    }
    
    
}
