#encoding: UTF-8
require 'minitest/autorun'
require_relative '../lib/item.rb'

class ItemTest < MiniTest::Unit::TestCase
  def teste_alternativa_1
    item = item_que_veio_do_metodo_sob_teste
    assert_equal 'Geladeira', item.descricao
    assert_equal 900.0, item.valor_unitario
    assert_equal 1, item.quantidade
    assert_equal 900.0, item.valor_total
  end
  def teste_alternativa_2
    item = item_que_veio_do_metodo_sob_teste
    item_esperado = Item.new('Geladeira', 1, 900.0)
    assert_equal item_esperado, item
  end
  def item_que_veio_do_metodo_sob_teste
    Item.new('Geladeira', 1, 900.0)
  end
end
