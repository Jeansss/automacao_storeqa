#language: pt
#utf-8
@testa
Funcionalidade: Efetuar Compra
  Eu como usuário do site
  Quero realizar uma compra no site store.demoqa
  Para realizar a aquisição de produtos


  Contexto: Usuario acessa a home do site
    Dado que eu esteja na home site store.demoqa

  @compra
  Cenário: Comprar produto
    Quando realizar a compra de um produto
    Então verificar o valor final da compra se há cobrança de frete

  @carrinho
  Cenário: Validar produtos no carrinho
    Quando enviar três itens para o carrinho
    Então verificar a quantidade de itens selecionado para compra

  @remover
  Cenário: Remover item do carrinho
    Quando avaliar o item mais cara e remove lo
    Então validar que foi retirado
