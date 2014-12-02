#encoding: UTF-8
require 'minitest/autorun'
require_relative '../lib/conversor_de_numero_romano'

class ConversorDeNumeroRomanoTest < MiniTest::Unit::TestCase
  def teste_deve_entender_o_simbolo_I
    romano = ConversorDeNumeroRomano.new
    numero = romano.converte 'I'
    assert_equal 1, numero
  end

  def teste_deve_entender_o_simbolo_V
    romano = ConversorDeNumeroRomano.new
    numero = romano.converte 'V'
    assert_equal 5, numero
  end

  def teste_deve_entender_dois_simbolos_como_II
    romano = ConversorDeNumeroRomano.new
    numero = romano.converte 'II'
    assert_equal 2, numero
  end

  def teste_deve_entender_quatro_simbolos_dois_a_dois_como_XXII
    romano = ConversorDeNumeroRomano.new
    numero = romano.converte 'XXII'
    assert_equal 22, numero
  end

  def teste_deve_entender_numeros_como_IX
    romano = ConversorDeNumeroRomano.new
    numero = romano.converte 'IX'
    assert_equal 9, numero
  end

  def teste_deve_entender_numeros_complexos_como_XXIV
    romano = ConversorDeNumeroRomano.new
    numero = romano.converte 'XXIV'
    assert_equal 24, numero
  end
end
