#encoding: UTF-8
require 'minitest/autorun'
require_relative '../lib/pedido.rb'
require_relative '../lib/gerador_de_nota_fiscal.rb'

class GeradorDeNotaFiscalTest < MiniTest::Unit::TestCase
  def teste_deve_gerar_NF_com_valor_de_imposto_descontado
    gerador = GeradorDeNotaFiscal.new
    pedido = Pedido.new('Mauricio', 1000, 1)

    nf = gerador.gera pedido

    assert_equal 1000 * 0.94, nf.valor
  end
end
