$(document).on('turbolinks:load', function() {
  // barra de progresso
  $('.upload').on('change', function(){
    $('#upload-file-info').val($(this).val());
  });
  
  Turbolinks.BrowserAdapter.prototype.showProgressBarAfterDelay = function() {
    this.progressBarTimeout = setTimeout(this.showProgressBar, 100);
  };

  $('[data-toggle=popover]').popover();
}).on("click", ".dynamic-link-to", function(e) {
  e.preventDefault();

  var $link = $(this);

  // Espera que atributo data-dynamic-link-to-route-function referencie uma função dentro do objeto Routes, que possui funções para cada rota da aplicação
  var funcName = $link.data().dynamicLinkToRouteFunction;
  if (funcName) {
    var func = Routes[funcName];
    if (!func)
      throw "Função para rota (" + funcName + ") definida no atributo data-dynamic-link-to-route-function não encontrada";
  } else
    throw "Atributo data-dynamic-link-to-route-function não informado em " + $link.toString();

  // Espera atributo data-dynamic-link-to-function-argument-input, que deve referenciar um input ao qual será obtido seu valor
  // Ou então espera atributo fixo data-dynamic-link-to-function-argument-value
  var $input = $($link.data().dynamicLinkToFunctionArgumentInput);
  var value;
  if ($input.length > 0) {
    value = $input.val();
    if (!value)
      return false;
  } else
    value = $link.data().dynamicLinkToFunctionArgumentValue;

  // Abre nova janela se atributo data-dynamic-link-to-new-window estiver definido, senão abre o link na janela atual
  var url = func.call(window, value);
  if ($link.data().dynamicLinkToNewWindow)
    window.open(url);
  else
    Turbolinks.visit(url);
}).on("click", "tr[data-href] td", function(e) {
  var $td = $(this);
  if ($td.find("a.btn").length === 0) // Apenas se a célula não possuir um botão
    Turbolinks.visit($td.parents("tr:first").data("href"));
}).on("click", "li[data-href], div[data-href]", function(e) {
  Turbolinks.visit($(this).data("href"));
});

