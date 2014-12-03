#encoding: UTF-8
require 'minitest/autorun'
require 'mocha/setup'
require_relative '../lib/copiadora.rb'

class CopiadoraTest < MiniTest::Unit::TestCase
  def teste_deve_ler_e_enviar_o_conteudo_lido
    escritor = mock
    leitor = mock

    leitor.expects(:tem_caracteres).twice.returns(true, false)
    leitor.expects(:le_caracteres).returns('mauricio')

    escritor.expects(:escreve).with('mauricio')

    copiadora = Copiadora.new leitor, escritor

    copiadora.copiar
  end
end
