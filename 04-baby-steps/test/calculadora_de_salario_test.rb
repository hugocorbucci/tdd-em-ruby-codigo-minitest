#encoding: UTF-8
require 'minitest/autorun'
require_relative '../lib/calculadora_de_salario.rb'
require_relative '../lib/funcionario.rb'

class CalculadoraDeSalarioTest < MiniTest::Unit::TestCase
  def teste_deve_calcular_salario_para_desenvolvedores_com_salario_abaixo_do_limite
    calculadora = CalculadoraDeSalario.new
    desenvolvedor = Funcionario.new('Mauricio', 1500.0, Cargo::DESENVOLVEDOR)

    salario = calculadora.calcula_salario desenvolvedor

    assert_equal 1500 * 0.9, salario
  end
  def teste_deve_calcular_salario_para_desenvolvedores_com_salario_acima_do_limite
    calculadora = CalculadoraDeSalario.new
    desenvolvedor = Funcionario.new('Mauricio', 4000.0, Cargo::DESENVOLVEDOR)

    salario = calculadora.calcula_salario desenvolvedor

    assert_equal 4000 * 0.8, salario
  end
  def teste_deve_calcular_salario_para_DBAs_com_salario_abaixo_do_limite
    calculadora = CalculadoraDeSalario.new
    desenvolvedor = Funcionario.new('Mauricio', 500.0, Cargo::DBA)

    salario = calculadora.calcula_salario desenvolvedor

    assert_equal 500 * 0.85, salario
  end
end