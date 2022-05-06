//
//  UICollectionViewCell.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 4.04.2022.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    static var identifier: String{
        return String(describing: self)
    }
    
    static var nib: UINib{
       return UINib(nibName: identifier, bundle: nil)
    }
}

extension UICollectionView{
    
    public func register(cellType: UICollectionViewCell.Type){
        register(cellType.nib, forCellWithReuseIdentifier: cellType.identifier)
    }
    
    public func dequeCell<T: UICollectionViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? T else {
            fatalError("CollectionView Cell Olusturulurken Hata Olustu")
        }
        return cell
    }
}
