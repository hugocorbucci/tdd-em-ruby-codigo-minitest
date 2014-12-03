#encoding: UTF-8
require 'minitest/autorun'
require 'mocha/setup'
require_relative '../lib/calculadora_de_imposto.rb'
require_relative '../lib/pedido.rb'

class CalculadoraDeImpostoTest < MiniTest::Unit::TestCase
  def teste_deve_calcular_imposto_para_pedidos_superiores_a_2000_reais
    tabela = mock
    # ensinando o mock a devolver 0.1 caso o método
    # pega_para_valor seja invocado com o valor 2500.0
    tabela.expects(:pega_para_valor).with(2500.0).returns(0.1)

    pedido = Pedido.new 2500

    calculadora = CalculadoraDeImposto.new tabela

    valor = calculadora.calcula_imposto pedido

    assert_equal 2500 * 0.1, valor
  end
end
