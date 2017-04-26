'use strict';
// ----------------------------------------------
// Common application
// ----------------------------------------------
/* global $ */

$(function () {
  // hack to force autocomplete='off' on Chrome
  var hackTimeout = setTimeout(function() {
    $('#search').attr('autocomplete', 'off');
    clearTimeout(hackTimeout);
  }, 0);

  autocomplete('#search', {
    hint: false,
    debug: true
  },
  [
    {
      source: autocomplete.sources.hits(index, { hitsPerPage: 5 }),
      displayKey: 'title',
      templates: {
        footer: '<div class="branding">Powered by <img src="https://www.algolia.com/assets/algolia128x40.png" /></div>',
        suggestion: function(suggestion) {

          var template = '<div class="hit"><div class="row">' +
          '<div class="col-xs-4">' +
          '<span class="title">' +
            suggestion._highlightResult.title.value +
          '</span>' +
          '</div>' +
          '<div class="col-xs-8">'+
            '<div class="path">';

          if (typeof suggestion.h2 !== 'undefined'){ template = template.concat('<span class="path">' +  suggestion._highlightResult.h2.value + '</span>') };

          if (typeof suggestion.h3 !== 'undefined'){ template = template.concat('<span class="path"> > ' +  suggestion._highlightResult.h3.value + '</span>') };

          template = template.concat(
            '</div>' +
            '<div class="snippet">' +  suggestion._highlightResult.text.value + '</div>' +
          '</div>' +
        '</div></div>');

        return template;
        }
      }
    }
  ]).on('autocomplete:selected', function(event, suggestion, dataset) {
    location.href = window.baseUrl + suggestion.url;
  }).focus();

});
