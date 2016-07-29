require 'cpf_faker'

class RegisterPage
  include PageObject

  attr_accessor :nome, :email, :cpf, :senha

  page_url 'https://lojatestetray26092014.commercesuite.com.br/loja/cadastro_layout.php?'

  text_field :nome_cliente, id: 'pf_nome_cliente'
  text_field :dt_nasc, id: 'pf_data_nascimento'
  text_field :cpf, id: 'pf_cpf_cliente'
  text_field :tel_fix, id: 'telefone_cliente'
  text_field :tel_cel, id: 'telefone_cliente_2'
  text_field :email, id: 'email_cliente'
  text_field :email_confirm, id: 'email_cliente2'
  checkbox :check_promo, id: 'email'
  text_field :senha, id: 'senha_cliente'
  text_field :senha_confirm, id: 'senha_cliente2'
  select_list :select_time, id: 'adicional_0'
  button :btn_avancar, class: 'botao-commerce-img'

  def cadastrar_pessoa_fisica(nome = Faker::Name.name, cpf = Faker::CPF.numeric, email = Faker::Internet.email, senha = '123123')
    self.nome_cliente = nome
    # self.dt_nasc = nasc
    self.cpf = cpf
    # self.tel_fix = tel_fix
    # self.tel_cel = tel_cel
    self.email = email
    self.email_confirm = email
    self.senha = senha
    self.senha_confirm = senha
    # btn_avancar
  end

end








