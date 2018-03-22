class Busca_page<SitePrism::Page

  set_url "http://store.demoqa.com"

  element :produtos, "#menu-item-72"
  element :adciona, :xpath, '//*[@id="default_products_page_container"]/div[3]/div[2]/form/div[2]'
  element :alert, :xpath, '//*[@id="default_products_page_container"]/div[3]/div[2]/form/div[2]/div[1]/div[2]'
  element :adciona2, :xpath, '//*[@id="default_products_page_container"]/div[4]/div[2]/form/div[2]'
  element :alert2, :xpath, '//*[@id="default_products_page_container"]/div[4]/div[2]/form/div[2]/div[1]/div[2]'
  element :adciona3, :xpath, '//*[@id="default_products_page_container"]/div[5]/div[2]/form/div[2]'
  element :alert3, :xpath, '//*[@id="default_products_page_container"]/div[5]/div[2]/form/div[2]/div[1]/div[2]'
  element :item1, :xpath, '//*[@id="default_products_page_container"]/div[3]/div[2]/h2/a  '
  element :item2, :xpath, '//*[@id="default_products_page_container"]/div[4]/div[2]/h2/a'
  element :item3, :xpath, '//*[@id="default_products_page_container"]/div[5]/div[2]/h2/a'
  element :carrinho, "#header_cart"
  element :primeiro_item, :xpath, '//*[@id="checkout_page_container"]/div[1]/table/tbody/tr[2]/td[2]/a'
  element :segundo_item, :xpath, '//*[@id="checkout_page_container"]/div[1]/table/tbody/tr[3]/td[2]/a'
  element :terceiro_item, :xpath, '//*[@id="checkout_page_container"]/div[1]/table/tbody/tr[4]/td[2]/a'
  element :continue, :xpath, '//*[@id="checkout_page_container"]/div[1]/a'
  element :item1_preco, :xpath, '//*[@id="checkout_page_container"]/div[1]/table/tbody/tr[2]/td[4]/span'
  element :item2_preco, :xpath, '//*[@id="checkout_page_container"]/div[1]/table/tbody/tr[3]/td[4]/span'
  element :item3_preco, :xpath, '//*[@id="checkout_page_container"]/div[1]/table/tbody/tr[4]/td[4]/span'
  element :remove1, :xpath, '//*[@id="checkout_page_container"]/div[1]/table/tbody/tr[2]/td[6]/form/input[4]'
  element :remove2, :xpath, '//*[@id="checkout_page_container"]/div[1]/table/tbody/tr[3]/td[6]/form/input[4]'
  element :remove3, :xpath, '//*[@id="checkout_page_container"]/div[1]/table/tbody/tr[4]/td[6]/form/input[4]'



  def buscar_produto
    produtos.click
    adciona.click
    wait_for_alert
    carrinho.click
    continue.click
  end

  def adciona_varios_itens
    produtos.click
    adciona.click
    wait_for_alert
    adciona2.click
    wait_for_alert2
    adciona3.click
    wait_for_alert3
    item01 = item1.text
    item02 = item2.text
    item03 = item3.text
    itens = []
    itens[0]=item01
    itens[1]=item02
    itens[2]=item03
   return itens
  end

  def verifica_itens itens
    carrinho.click
    primeiro = primeiro_item.text
    segundo = segundo_item.text
    terceiro = terceiro_item.text
    vr = terceiro == itens[2]
    v1 = segundo == itens[1]
    v2 = primeiro == itens[0]
    puts vr
    puts v1
    puts v2
    puts "Os 3 itens adcionados ao carrinho estão corretos"
  end

  def remove_item
    item1 =  item1_preco.text.sub!'$',''
    item2= item2_preco.text.sub!'$',''
    item3= item3_preco.text.sub!'$',''

    mercadoria1 = item1.to_f
    mercadoria2 = item2.to_f
    mercadoria3 = item3.to_f

    if mercadoria1 > mercadoria2 and mercadoria1 > mercadoria3
      remove1.click
      caro = mercadoria1
    elsif mercadoria2 > mercadoria1 and mercadoria2 > mercadoria3
        remove2.click
        caro = mercadoria2
    elsif mercadoria3 > mercadoria1 and mercadoria3 > mercadoria2
        remove3.click
        caro = mercadoria3
    end

    return caro
  end
end
