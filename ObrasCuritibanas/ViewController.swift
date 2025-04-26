//
//  ViewController.swift
//  ObrasCuritibanas
//
//  Created by francielly pazello on 26/04/25.
//

import UIKit

// Classe responsável por exibir a lista de obras
class ViewController: UIViewController {
    
    private var obras: [ObraDeArte] = obrasMockadas
    
    // Conexão com a Collection View do Storyboard
    @IBOutlet var collectionView: UICollectionView!
    
    // Método chamado ao carregar a tela
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 400, height: 220) // Definindo o tamanho da célula
        layout.minimumLineSpacing = 4 // Espaçamento vertical entre as linhas
        layout.minimumInteritemSpacing = 4 // Espaçamento horizontal entre itens
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4) // Margem nas bordas
               
               collectionView.collectionViewLayout = layout
        
        
       // collectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)

        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Item selecionado")
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell else {
            fatalError("Erro ao criar célula")
        }
        
        let obra = obras[indexPath.row]
        cell.configure(with: obra)

        return cell
    }

}


// Caso deseje configurar o tamanho das células:
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // Definindo o tamanho de cada célula
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 220)
    }
}


