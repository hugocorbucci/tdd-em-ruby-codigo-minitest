#encoding: UTF-8
require 'minitest/autorun'
require 'mocha/setup'
require_relative '../lib/pedido.rb'
require_relative '../lib/gerador_de_nota_fiscal.rb'

class GeradorDeNotaFiscalTest < MiniTest::Unit::TestCase
  def teste_deve_persistir_NF_gerada
    dao = mock
    dao.expects(:persiste)
    sap = stub_everything
    
    gerador = GeradorDeNotaFiscal.new dao, sap
    pedido = Pedido.new('Mauricio', 1000, 1)

    nf = gerador.gera pedido
  end
  def teste_deve_enviar_NF_gerada_para_SAP
    dao = stub_everything
    sap = mock.tap{|sap| sap.expects(:envia)}

    gerador = GeradorDeNotaFiscal.new dao, sap
    pedido = Pedido.new('Mauricio', 1000, 1)

    nf = gerador.gera pedido
  end
end
