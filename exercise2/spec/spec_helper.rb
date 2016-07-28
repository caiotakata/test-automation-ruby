# carregando as gems
require 'require_all'
require 'selenium-webdriver'
require 'rspec/expectations'
require 'page-object'

# carregando todos os page objects
require_all 'pages'
require_all 'modules'

# bloco de configuração do RSpec
RSpec.configure do |config|

  # config.include LojaHeader
  # incluindo a fábrica de páginas
  config.include PageObject::PageFactory

  # adicionando um "before hook" global (before = antes, hook = gancho)
  # bloco de código que vai rodar antes de cada (each) teste (it)
  config.before(:each) do

    extend LojaHeader
    # criando uma instância do webdriver para firefox (abre o browser)
    # vai estar disponível na variável @driver
    @browser = Selenium::WebDriver.for :firefox

    # pra manter a compatibilidade dos testes da aula 1
    @driver = @browser

    # setando implicit wait de 10 segundos
    @browser.manage.timeouts.implicit_wait = 10

    # setando page load timeout de 60 segundos
    @browser.manage.timeouts.page_load = 60

    # maximizando a janela
    @browser.manage.window.maximize
  end

  # adicionando um "after hook" global (after = depois, hook = gancho)
  # bloco de código que vai rodar depois de cada (each) teste (it)
  config.after(:each) do
    # encerrando a instância do webdriver (fecha o browser)
    # @browser.quit
  end

end
