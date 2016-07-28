require 'spec_helper'

class TestRegister

name  = Faker::Name.name
email = Faker::Internet.email
cpf   = Faker::CPF.numeric

  describe 'Cadastro loja tray' do
    it 'Cadastra novo cliente com dados válidos' do
      nome = ''
      visit(HomePage).link_cadastro_element.click
      on(RegisterPage) do |register|
        nome  = register.nome_cliente
        register.cadastrar_pessoa_fisica(name, cpf, email, '123123')
      end
      expect(on(RegisterSuccefulPage).nome_cliente).to equal(nome)
    end
  end

end