(function () {
  'use strict';
  document.querySelectorAll('[data-filtro-listado]').forEach(function (panel) {
    var input = panel.querySelector('[data-filtro-texto]');
    var clear = panel.querySelector('[data-filtro-limpiar]');
    var count = panel.querySelector('[data-filtro-conteo]');
    var table = panel.nextElementSibling && panel.nextElementSibling.querySelector('table');
    if (!table || !input) return;
    var rows = Array.from(table.querySelectorAll('tbody tr')).filter(function (tr) {
      return tr.querySelectorAll('td').length > 1 && !tr.querySelector('.empty-table');
    });
    var empty = document.createElement('tr');
    var td = document.createElement('td');
    td.colSpan = table.querySelectorAll('thead th').length || 1;
    td.className = 'empty-table';
    td.textContent = 'No se encontraron registros con esa búsqueda.';
    empty.appendChild(td);
    empty.hidden = true;
    table.querySelector('tbody').appendChild(empty);
    function normalize(s) { return String(s || '').normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase().trim(); }
    function filter() {
      var q = normalize(input.value);
      var visible = 0;
      rows.forEach(function (tr) {
        var match = normalize(tr.textContent).includes(q);
        tr.hidden = !match;
        tr.style.display = match ? '' : 'none';
        if (match) visible++;
      });
      empty.hidden = visible !== 0 || rows.length === 0;
      empty.style.display = empty.hidden ? 'none' : '';
      count.textContent = 'Registros encontrados: ' + visible;
    }
    input.addEventListener('input', filter);
    clear.addEventListener('click', function () { input.value = ''; filter(); input.focus(); });
    filter();
  });
})();
