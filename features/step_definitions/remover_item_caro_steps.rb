Quando("avaliar o item mais cara e remove lo") do
  @acessa_carrinho = Busca_page.new
  itens = @acessa_carrinho.adciona_varios_itens
  @acessa_carrinho.verifica_itens itens
end

Então("validar que foi retirado") do
  item_mais_caro = @acessa_carrinho.remove_item
  verdade = expect(@acessa_carrinho).to have_no_content(item_mais_caro)
  puts verdade
end
