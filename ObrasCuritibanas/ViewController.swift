//
//  ViewController.swift
//  ObrasCuritibanas
//
//  Created by francielly pazello on 26/04/25.
//

import UIKit

// exibir a lista de obras
class ViewController: UIViewController {
    
    private var obras: [ObraDeArte] = obrasMockadas
    
    // conexão com a Collection View do Storyboard
    @IBOutlet var collectionView: UICollectionView!
    
    // carregar a tela
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarCollectionView()
    }
    
    //recalcule o layout toda vez que girar a tela
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            self.collectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }

    //  configurar a Collection View
    private func configurarCollectionView() {
        let layout = UICollectionViewFlowLayout()
       //layout.itemSize = CGSize(width: 400, height: 220) // tamanho da célula
        layout.minimumLineSpacing = 4 // entre linhas
        layout.minimumInteritemSpacing = 4 // entre itens
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4) // margens
        
        collectionView.collectionViewLayout = layout
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // navegação para a tela de detalhes
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarDetalhesObra",
           let detalhesVC = segue.destination as? DetalhesObraViewController,
           let obra = sender as? ObraDeArte {
            detalhesVC.obra = obra
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let obraSelecionada = obras[indexPath.item]
        performSegue(withIdentifier: "mostrarDetalhesObra", sender: obraSelecionada)
    }
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obras.count
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell else {
            fatalError("Erro ao criar célula")
        }
        
        let obra = obras[indexPath.item]
        cell.configure(with: obra)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // tamanho da célula
   // func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     //   return CGSize(width: 400, height: 220)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 12 // espaço entre as células
        let itemsPerRow: CGFloat = UIDevice.current.orientation.isLandscape ? 2 : 1

        let totalSpacing = spacing * (itemsPerRow + 1) // espaçamento entre itens + laterais
        let availableWidth = collectionView.bounds.width - totalSpacing
        let itemWidth = availableWidth / itemsPerRow
        let itemHeight = itemWidth * 0.6 // proporção altura/largura

        return CGSize(width: itemWidth, height: itemHeight)
    }
}

