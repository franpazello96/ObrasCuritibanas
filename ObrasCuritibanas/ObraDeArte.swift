//
//  Obra.swift
//  ObrasCuritibanas
//
//  Created by francielly pazello on 26/04/25.
//

import Foundation

struct ObraDeArte{
    let titulo: String
    let artista: String
    let ano: Int
    let estilo: String
    let imagemNome: String
    let descricao: String
}

let obrasMockadas: [ObraDeArte] = [
    
    ObraDeArte(titulo: "Natureza Morta com Pinhão", artista: "Leonor Botteri", ano: 1964, estilo: "Surrealismo", imagemNome: "obra1", descricao: "Uma composição que explora atmosferas oníricas e silenciosas, remetendo ao estilo de Giorgio de Chirico."),

    ObraDeArte(titulo: "O vento da Noite", artista: "Leonor Botteri", ano: 1960, estilo: "Surrealismo", imagemNome: "obra2", descricao: "Obra que reflete a influência de atmosferas oníricas e o silêncio característico do surrealismo."),

    ObraDeArte(titulo: "Araucária", artista: "Theodoro de Bona", ano: 1944, estilo: "Regionalista", imagemNome: "obra5", descricao: "Uma celebração da árvore símbolo do Paraná."),

    ObraDeArte(titulo: "Paisagem Paranaense", artista: "Theodoro de Bona", ano: 1940, estilo: "Regionalista", imagemNome: "obra6", descricao: "Paisagem que destaca as belezas naturais do Paraná."),

    ObraDeArte(titulo: "Composição em gris", artista: "Domicio Pedroso", ano: 1995, estilo: "Abstrato", imagemNome: "obra7", descricao: "Exploração de formas e tons monocromáticos em uma composição abstrata."),

    ObraDeArte(titulo: "Rua de Nápoles", artista: "Domicio Pedroso", ano: 1961, estilo: "Abstrato", imagemNome: "obra8", descricao: "Uma interpretação artística de uma rua em Nápoles, com traços abstratos."),

    ObraDeArte(titulo: "Casario", artista: "Domicio Pedroso", ano: 1986, estilo: "Abstrato", imagemNome: "obra9", descricao: "Representação de casarios urbanos com influência cubista e abstrata.")
    
    
]
