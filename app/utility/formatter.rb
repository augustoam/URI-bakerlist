class Formatter
  def conteudo_resposta_formatter(bt, rd_bt, txt)

    value = {respostas: {}}

    if (bt != nil)
      value[:respostas][:botao] = bt
    end

    if (rd_bt != nil)
      value[:respostas][:radio_botao] = rd_bt
    end

    if (txt != nil)
      value[:respostas][:texto] = txt
    end 

    return value.to_json
  end
end
