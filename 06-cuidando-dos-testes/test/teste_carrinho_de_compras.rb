#encoding: UTF-8
require 'minitest/autorun'
require_relative '../lib/item.rb'
require_relative '../lib/carrinho_de_compras.rb'

class TesteCarrinhoDeCompras < MiniTest::Unit::TestCase
  def setup
    @carrinho = CarrinhoDeCompras.new
  end
  def teste_deve_comecar_vazio
    assert_equal 0, @carrinho.itens.size
  end
  def teste_deve_ter_um_item_apos_adicao
    geladeira = Item.new('Geladeira', 1, 900.0)
    @carrinho << geladeira

    assert_equal 1, @carrinho.itens.size
    assert @carrinho.itens.include?(geladeira)
  end
  def teste_deve_ter_dois_itens_apos_duas_adicoes
    geladeira = Item.new('Geladeira', 1, 900.0)
    @carrinho << geladeira

    fogao = Item.new('Fogão', 1, 600.0)
    @carrinho << fogao

    assert_equal 2, @carrinho.itens.size
    assert @carrinho.itens.include?(fogao)
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
