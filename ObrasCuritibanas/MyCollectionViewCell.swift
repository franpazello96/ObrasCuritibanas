//
//  MyCollectionViewCell.swift
//  ObrasCuritibanas
//
//  Created by francielly pazello on 26/04/25.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var autorLabel: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with obra: ObraDeArte) {
        if let image = UIImage(named: obra.imagemNome) {
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
        } else {
            print("Erro: Imagem '\(obra.imagemNome)' não encontrada.")
            imageView.image = nil
        }
        
        tituloLabel.text = obra.titulo
        autorLabel.text = obra.artista
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
}
