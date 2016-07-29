require 'spec_helper'

class TestRegister
  describe 'Cadastro loja tray' do
    it 'Cadastra novo cliente com dados válidos' do
     nome = ''
     visit(HomePage).link_cadastro_element.click
     on(RegisterPage) do |register|
      register.cadastrar_pessoa_fisica
      nome  = register.nome_cliente
      register.btn_avancar
      end
      expect(on(RegisterSuccefulPage).nome_cliente).to eq(nome)
    end
  end

end