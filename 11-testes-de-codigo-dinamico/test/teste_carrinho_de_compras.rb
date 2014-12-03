#encoding: UTF-8
require 'minitest/autorun'
require_relative '../lib/carrinho_de_compras.rb'

class TesteCarrinhoDeCompras < MiniTest::Unit::TestCase
  class ItemFalso
    attr_reader :quantidade
    def initialize(quantidade)
      @quantidade = quantidade
    end
    def valor
      1
    end
  end
  def teste_calcula_total_considerando_quantidades
    carrinho = CarrinhoDeCompras.new

    carrinho << ItemFalso.new(1)
    carrinho << ItemFalso.new(5)

    assert_equal 6, carrinho.valor_total
  end
end
