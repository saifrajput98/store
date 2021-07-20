$(document).ready(function(){
  $('.line-items').on('cocoon:after-insert', function(e, child) {
    $('.quantity').on('change', function() {
    });

    $('.totalProductPrice').on('change', function() {
      

      parentItem = $(this).parents(".lineItemParent");
      price = parentItem.find('.product').find(":selected").data('price');
      quantity = parentItem.find(".quantity").val();
      discount = parentItem.find(".discount").val();
      // total_price = parentItem.find(".totalprice");
      discount_amount = (quantity * price) * (discount/100)

      console.log(price)

      if (quantity > 0 ) {

      var amount = (parseInt(quantity) * parseFloat(price) - discount_amount);
      parentItem.find(".totalprice").val(amount);
      // console.log(price);
      // console.log(quantity);
      // console.log(discount);
      // console.log(amount);

      var children = $(".line-items").children();
      children.splice(-1,1);
      var discounts = [];
      var prices = [];
      var quantities = [];

      children.each(function(){
        discounts.push($(this).find(".discount").val());
        prices.push($(this).find(".product").find(":selected").data('price')); 
        quantities.push($(this).find(".quantity").val());
      })

      var t_discount = 0;
      var gross_amount = 0;
      var total_discount_amount = 0;

      // for (var i = 0; i < discounts.length; i++) {
      //  t_discount += parseInt(discounts[i]);
      // }
      // console.log(t_discount+"saif")

      for (var i = 0; i < prices.length; i++) {
       gross_amount = parseInt(gross_amount) +(parseInt(prices[i]) * parseInt(quantities[i]));
      }
      
      $(".gross_amount").val(gross_amount);

      // $(".unitprice").val();

      parentItem.find('.unitprice').val(price)


      for (var i = 0; i < prices.length; i++) {
        // console.log(t_discount)
      total_discount_amount += (parseInt(quantities[i]) * parseFloat(prices[i])) * parseFloat(discounts[i]/100)
      }
      $(".discount_amount").val(total_discount_amount);


       var net_amount = gross_amount - total_discount_amount;
       $(".net_amount").val(net_amount);
      }
    });

    // $('.totalprice').on('change',function(){

    // });
  });
});
