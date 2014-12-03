#encoding: UTF-8
require 'minitest/autorun'
require 'mocha/setup'
require_relative '../lib/botao.rb'

class TesteBotao < MiniTest::Unit::TestCase
  def teste_chama_metodo_no_alvo
    botao = Botao.new(lambda{|alvo| alvo.teste})
    alvo = mock
    alvo.expects(:teste).with()

    botao.executa_em(alvo)
  end
  def teste_chama_metodo_no_alvo_com_parametros_ao_executar
    botao = Botao.new(lambda{ |alvo|
      alvo.teste(:parametro1, [:parametro2])
    })
    alvo = mock
    alvo.expects(:teste).with(:parametro1, [:parametro2])

    botao.executa_em(alvo)
  end
end
