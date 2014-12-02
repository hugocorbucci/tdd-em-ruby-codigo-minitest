#encoding: UTF-8
require 'minitest/autorun'
require_relative '../lib/maior_e_menor.rb'
require_relative '../lib/carrinho_de_compras.rb'
require_relative '../lib/produto.rb'

class TesteMaiorMenor < MiniTest::Unit::TestCase
  def test_ordem_descrescente
    carrinho = CarrinhoDeCompras.new

    carrinho << Produto.new('Geladeira', 450.0)
    carrinho << Produto.new('Liquidificador', 250.0)
    carrinho << Produto.new('Jogo de pratos', 70.0)

    algoritmo = MaiorEMenor.new
    algoritmo.encontra carrinho
    
    assert_equal 'Jogo de pratos', algoritmo.menor.nome
    assert_equal 'Geladeira', algoritmo.maior.nome
  end
  def test_apenas_um_produto
    carrinho = CarrinhoDeCompras.new
    carrinho << Produto.new('Geladeira', 450.0)

    algoritmo = MaiorEMenor.new
    algoritmo.encontra carrinho

    assert_equal 'Geladeira', algoritmo.menor.nome
    assert_equal 'Geladeira', algoritmo.maior.nome
  end
end
