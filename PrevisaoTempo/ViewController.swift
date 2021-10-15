//
//  ViewController.swift
//  PrevisaoTempo
//
//  Created by Rayana Prata Neves on 15/10/21.
//

import UIKit

class ViewController: UIViewController {

    var previsaoCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // o layout vai definir alguns aspectos de como a collection vai ser apresentada na tela
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 60.0, height: 60.0)
        
        previsaoCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        previsaoCollection.delegate = self
        previsaoCollection.dataSource = self
        
        self.view.addSubview(previsaoCollection)
        
//        NSLayoutConstraint.activate([
//            
//        ])
    }

}

extension ViewController: UICollectionViewDelegate {
    
}

/// UICollectionView também vai ter ses métodos de Delegate e DataSource
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /// Número de itens na seção
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    /// Vai passar qual célula vai entrar no espaco de cada item da colecao
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
