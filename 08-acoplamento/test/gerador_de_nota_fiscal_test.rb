#encoding: UTF-8
require 'minitest/autorun'
require 'mocha/setup'
require_relative '../lib/pedido.rb'
require_relative '../lib/gerador_de_nota_fiscal.rb'

class GeradorDeNotaFiscalTest < MiniTest::Unit::TestCase
  def teste_deve_persistir_NF_gerada
    # criando o mock
    dao = mock
    # marcando o que esperamos que aconteça
    dao.expects(:persiste)

    gerador = GeradorDeNotaFiscal.new dao
    pedido = Pedido.new('Mauricio', 1000, 1)

    nf = gerador.gera pedido
  end
end
