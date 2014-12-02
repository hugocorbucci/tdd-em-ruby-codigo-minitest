#encoding: UTF-8
require 'minitest/autorun'
require_relative '../lib/item.rb'
require_relative '../lib/carrinho_de_compras.rb'
require_relative '../lib/maior_preco.rb'

class TesteMaiorPreco < MiniTest::Unit::TestCase
  def teste_deve_retornar_zero_se_carrinho_vazio
    carrinho = CarrinhoDeCompras.new

    algoritmo = MaiorPreco.new
    valor = algoritmo.encontra carrinho

    assert_equal 0, valor
  end
end