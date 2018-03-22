class Compra_page<SitePrism::Page



  element :lista, "#change_country"
  element :opcao, :xpath, '//*[@id="current_country"]/option[33]'
  element :estado_envio, :xpath, '//*[@id="change_country"]/input[2]'
  element :calcula_envio, :xpath, '//*[@id="change_country"]/input[4]'
  element :email, "#wpsc_checkout_form_9"
  element :nome, "#wpsc_checkout_form_2"
  element :sobrenome, "#wpsc_checkout_form_3"
  element :endereco, "#wpsc_checkout_form_4"
  element :cidade, "#wpsc_checkout_form_5"
  element :estado, "#wpsc_checkout_form_6"
  element :regiao, "#region_country_form_7"
  element :br, :xpath, '//*[@id="wpsc_checkout_form_7"]/option[33]'
  element :cep, "#wpsc_checkout_form_8"
  element :tel, "#wpsc_checkout_form_18"
  element :check, "#shippingSameBilling"
  element :button, :xpath,'//*[@id="wpsc_shopping_cart_container"]/form/div[4]/div/div/span/input'
  element :preco_item, :xpath, '//*[@id="wpsc_shopping_cart_container"]/form/div[3]/table/tbody/tr[3]/td[2]/span'
  element :frete, :xpath, '//*[@id="wpsc_shopping_cart_container"]/form/div[3]/table/tbody/tr[2]/td[2]'
  element :total, '#checkout_total'

  def preencher_dados email1, name, last, adress, city, state, cod, number
    lista.click
    opcao.click
    estado_envio.set(state)
    calcula_envio.click
    email.set(email1)
    nome.set(name)
    sobrenome.set(last)
    endereco.set(adress)
    cidade.set(city)
    estado.set(state)
    regiao.click
    br.click
    cep.set(cod)
    tel.set(number)
    check.click
  end

  def confirma
    preco_str = preco_item.text.sub! '$',''
    frete_str =  frete.text.sub! '$',''
    total_str = total.text.sub! '$',''


    preco_limpo = preco_str.to_f
    frete_limpo = frete_str.to_f
    total_limpo = total_str.to_f

    puts "Valor do item: $#{preco_limpo}"

    if frete_limpo !=0
      puts "Valor do frete: $#{frete_limpo}"
    else
      puts "Não houve custo de envio"
    end

      puts "Valor total: $#{total_limpo}"
        button.click
    end
end
