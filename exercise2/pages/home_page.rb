class HomePage
  include PageObject

  page_url 'https://lojatestetray26092014.commercesuite.com.br/'

  link :link_cadastro, css: "[data-tray-tst='cadastro']"
  link :link_login, css: "[data-tray-tst='login']"

end


