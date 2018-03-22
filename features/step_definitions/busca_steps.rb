Dado("que eu esteja na home site store.demoqa") do
  @acessa = Busca_page.new
  @acessa.load
end

Quando("realizar a compra de um produto") do
  @acessa.buscar_produto
  @comprando = Compra_page.new
  @comprando.preencher_dados "test@testing3.com", "jonyy", "test", "Rua Tacomare", "São Paulo", "São Paulo", "04171020", "59940987"
end

Então("verificar o valor final da compra se há cobrança de frete") do
  @comprando.confirma
end
