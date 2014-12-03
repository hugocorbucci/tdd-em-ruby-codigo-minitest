#encoding: UTF-8
require 'minitest/autorun'
require_relative '../lib/calculadora.rb'

class CalculadoraTest < MiniTest::Unit::TestCase
  def teste_deve_somar_um_mais_um
    assert_equal 2, Calculadora.new.soma(1,1)
  end
  def teste_deve_somar_um_mais_dois
    assert_equal 3, Calculadora.new.soma(1,2)
  end
  def teste_deve_somar_dois_mais_dois
    assert_equal 4, Calculadora.new.soma(2,2)
  end
end
