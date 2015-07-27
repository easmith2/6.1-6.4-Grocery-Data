// initial pagination implementation, 7/21/15:
//
// $(document).ready(function(){
//   $('ul.item_list > li').hide();
//   $('li.section_1').show();
// $('ul.link_list > li > a').click(function(){
//   $('ul.item_list > li').hide();
//   var item_list = $(this).attr('number');
//   $('li.section_' + item_list).show();
// })
// })


$(document).ready(function() {
  itemPagination.init();
});

var itemPagination = {
  init: function() {
    itemPagination.initEvents();
  },

  initEvents: function() {
    $(document).on('click', 'a#page_link', function(event) {
      event.preventDefault();
      var pageNumber = $(this).html();
      itemPagination.ajaxCall(pageNumber);
    })
  },

  ajaxCall: function(pageNumber) {
    $.ajax({
      method: 'GET',
      url: "/items_paginated/"+pageNumber+".json",
      success: function(data) {
        $('#now-viewing')[0].innerHTML = "viewing page " + pageNumber;
        if ($('ul.item_list')) {
          $('ul.item_list').remove();
        }
        $('<ul class="item_list"></ul>').insertAfter("#now-viewing");
        data.items.forEach(function(el) {
          var line = "";
          var priceString = el.price_in_cents.toString();
          var priceLength = priceString.length;
          var priceFormat = priceString.slice(0, priceLength-2) + "." + priceString.slice(priceLength - 2, priceLength);
          line += "<b>" + el.name + "</b>";
          line += " ($" + priceFormat;
          line += ", <i>" + el.category + ")</i>";
          line += "<br>";
          $('ul.item_list').append("<li>" + line + "</li>");
        });

        var list = document.getElementsByClassName('link_list');
        var $list_children = $(list).children();
        var pageNumAsInt = parseInt(pageNumber,10);
        if($list_children.length <= 5) {
          for(i = 0; i < $list_children.length; i++){
            $list_children[i].innerHTML = "<a id='page_link' href='/items_paginated/"+(i+1)+"/'>"+(i+1)+"</a>";
          }
        } else {
          for(i = (pageNumbAsInt - 2); i <= (pageNumbAsInt + 2); i++){
            $list_children[i].innerHTML = "<a id='page_link' href='/items_paginated/"+i+"/'>"+i+"</a>";
          }
        }
      },
      error: function(error) {
        console.log(error);
      }
    });
  }


}
