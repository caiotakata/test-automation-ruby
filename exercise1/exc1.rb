require 'selenium-webdriver'
require 'faker'
require 'cpf_faker'

# Seta as variaveis que serao usadas no formulario de cadastro
name = Faker::Name.name
email = Faker::Internet.email
cpf = Faker::CPF.numeric
# Seta a variavel com um tempo de espera
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
# Navega ate a home page
driver = Selenium::WebDriver.for :firefox
driver.navigate.to "https://lojatestetray26092014.commercesuite.com.br"
# Preenche formulario de cadastro
driver.find_element(:css, '[data-tray-tst=cadastro]').click
driver.find_element(:id, "pf_nome_cliente").clear
driver.find_element(:id, "pf_nome_cliente").send_keys(name)
driver.find_element(:id, "pf_data_nascimento").clear
driver.find_element(:id, "pf_data_nascimento").send_keys('22/08/1992')
driver.find_element(:id, "pf_cpf_cliente").clear
driver.find_element(:id, "pf_cpf_cliente").send_keys(cpf)
driver.find_element(:id, "telefone_cliente").clear
driver.find_element(:id, "telefone_cliente").send_keys('(143414-5555')
driver.find_element(:id, "telefone_cliente_2").clear
driver.find_element(:id, "telefone_cliente_2").send_keys('1498475624')
driver.find_element(:id, "email_cliente").clear
driver.find_element(:id, "email_cliente").send_keys(email)
driver.find_element(:id, "email_cliente2").clear
driver.find_element(:id, "email_cliente2").send_keys(email)
driver.find_element(:id, "senha_cliente").clear
driver.find_element(:id, "senha_cliente").send_keys('123123')
driver.find_element(:id, "senha_cliente2").clear
driver.find_element(:id, "senha_cliente2").send_keys('123123')
# Desmarca o checkbox
driver.find_element(:id, 'email').click
# Seleciona o selectbox 'Time'
select_list = wait.until {
  element = driver.find_element(:id, "adicional_0")
  element if element.displayed?
  }
# Clica na opção do selectbox
options=select_list.find_elements(:tag_name => "option")
options.each do |opt|
  if opt.text == "São Paulo"
    opt.click
    break
  end
end
# Clica no botão 'avançar' para concluir o cadastro
driver.find_element(:css, '.botao-commerce-img').click
# Espera exibir a mensagem
success_message = wait.until {
    element = driver.find_element(:css, '[data-tray-tst=saudacao]')
    element if element.displayed?
}
# Mensagem de sucesso caso o teste seja satisfatorio
puts "Test Passed: Account create" if success_message.displayed?

driver.quit