#encoding: UTF-8
require 'minitest/autorun'
require 'mocha/setup'
require_relative '../lib/pedido.rb'
require_relative '../lib/gerador_de_nota_fiscal.rb'

class GeradorDeNotaFiscalTest < MiniTest::Unit::TestCase
  def teste_deve_invocar_acoes_posteriores
    acao1 = mock.tap{|dao| dao.expects(:executa)}
    acao2 = mock.tap{|sap| sap.expects(:executa)}

    gerador = GeradorDeNotaFiscal.new [acao1, acao2]
    pedido = Pedido.new('Mauricio', 1000, 1)

    nf = gerador.gera pedido
  end
  def teste_deve_consultar_a_tabela_para_calcular_valor
    relogio = mock.tap{|relogio| relogio.expects(:hoje) }
    tabela = mock
    tabela.expects(:[]).with(1000.0).returns(0.2)

    gerador = GeradorDeNotaFiscal.new [], relogio, tabela
    pedido = Pedido.new('Mauricio', 1000, 1)

    nf = gerador.gera pedido

    assert_equal 1000 * 0.2, nf.valor
  end
end
