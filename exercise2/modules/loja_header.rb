module LojaHeader
  include PageObject

  form :buscar_no_site, css: '[data-tray-tst="form_busca"]'
  text_field :busca_palavra, css: '[data-tray-tst="busca_palavra"]'
  button :botao_busca, css: '[data-tray-tst="botao_buscar"]'
  link :amount_cart, css: '[data-tray-tst="link_qtde_carrinho"]'
  link :value_cart, css: '[data-tray-tst="link_valor_carrinho"]'

  def buscar(termo = 'Produto Teste')
    self.busca_palavra = termo
    botao_busca
  end

end




