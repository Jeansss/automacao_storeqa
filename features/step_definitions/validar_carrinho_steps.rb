Quando("enviar três itens para o carrinho") do
  @carrinho= Busca_page.new
  @prod = @carrinho.adciona_varios_itens
end

Então("verificar a quantidade de itens selecionado para compra") do
  exibe_resultado = @carrinho.verifica_itens @prod
end
