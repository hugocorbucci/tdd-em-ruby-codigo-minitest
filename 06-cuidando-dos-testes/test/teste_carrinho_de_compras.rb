#encoding: UTF-8
require 'minitest/autorun'
require_relative '../lib/item.rb'
require_relative '../lib/carrinho_de_compras.rb'

class TesteCarrinhoDeCompras < MiniTest::Unit::TestCase
  def setup
    @carrinho = CarrinhoDeCompras.new
  end
  def teste_deve_adicionar_itens
    # garante que o carrinho está vazio
    assert_equal 0, @carrinho.itens.size

    item = Item.new('Geladeira', 1, 900.0)
    @carrinho << item

    assert_equal 1, @carrinho.itens.size
    assert_equal item, @carrinho.itens[0]
  end
  def teste_deve_retornar_zero_se_carrinho_vazio
    assert_equal 0, @carrinho.maior_valor
  end
  def teste_deve_retornar_valor_do_item_se_carrinho_com_1_elemento
    @carrinho << Item.new('Geladeira', 1, 900.0)

    assert_equal 900.0, @carrinho.maior_valor
  end
  def teste_deve_retornar_maior_valor_se_carrinho_contem_muitos_elementos
    @carrinho << Item.new('Geladeira', 1, 900.0)
    @carrinho << Item.new('Fogão', 1, 1500.0)
    @carrinho << Item.new('Máquina de Lavar', 1, 750.0)

    assert_equal 1500.0, @carrinho.maior_valor
  end
end
