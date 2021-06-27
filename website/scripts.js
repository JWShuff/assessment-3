const productDict = {
  'blackpen': ["Black Pen", 1.00],
  'paperclip': ["Paper Clip", .2],
  'reampaper': ["Ream of Paper", 5.45],
  'badrug': ['Badly Designed Rug', 150.00],
  'lamp': ['Lamp', 15.00],
  'pillow': ["Throw Pillow", 5.99],
  'blender': ["Blender", 45.67],
  'knife': ["Knife", 3.50],
  'glass': ["Collins Glass", 1.00],
  'bathmat': ["Bathmat", 4.49],
  'towel': ["Towel", 10.00],
  'mirror': ["Mirror", 75.00]
}

// formats price data to USD style presentation
const formatter = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'USD',
});

// Gets page html for shoppingcart check
function getPageName(url) {
  return url.split('/').pop().split('.')[0];
}

var shoppingCart = [];

// Builds and displays the empty cart notification in lieu of cart display

const loadShoppingCart = () => {
  // load shopping cart from localStorage
  shoppingCart = JSON.parse(localStorage.getItem('cart'));

  // In the event localStorage is null, set shoppingCart to empty array
  if(shoppingCart == null) {
    shoppingCart = [];
  }
  // if no items in shopping cart, display empty cart notification:
  console.log(`shopping cart is: ${shoppingCart}`)
  // If on the shopping cart page (uniquely contains cart div)
  // generate the shopping cart and display it or empty cart message
  if(getPageName(location.href) == 'shoppingcart') {
    return createShoppingCart();
  }
  return(shoppingCart)
}

const createShoppingCart = () => {
  // if cart is empty:
  if(shoppingCart == null || shoppingCart.length == 0) {
    return emptyCartNotification()
  }

  // if items in shopping cart check if empty cart notification is up:
  if (document.body.contains(document.getElementById('empty-cart-notif'))) {
    document.getElementById('empty-cart-notif').remove();
  }
  // element to insert built list and button:
  let cartDiv = document.getElementById('cart')
  
  // set up for shopping list card:
  let cartCard = document.createElement('div');
  cartCard.setAttribute('id', 'shopping-cart-card')
  // cartCard.setAttribute('style', 'width: 24rem')
  cartCard.setAttribute('class', 'card col-sm-5') // level 1 row
  
  let cartCardBody = document.createElement('div');
  cartCardBody.setAttribute('class', 'card-body');
  
  
  let cartCardTitle = document.createElement('h5');
  cartCardTitle.setAttribute('class', 'card-title');
  let cartTitleText = "Your shopping cart contains: <hr>";
  
  let cartListParent = document.createElement('div');
  
  //build shopping cart and items:
  for (let i = 0; i < shoppingCart.length; i++) {
    console.log(shoppingCart[i])
    // create a row
    let cartListRow = document.createElement('div');
    cartListRow.setAttribute('class', 'row')

    //create the subelements that split the row:
    let cartProductNameRow = document.createElement('row');
    cartProductNameRow.setAttribute('class', 'col')
    let cartProductPriceRow = document.createElement('div');
    cartProductPriceRow.setAttribute('class', 'col')

    // create the text fields that go into the subelements above
    let cartProductName = document.createElement('p');
    cartProductName.setAttribute('class', 'card-text my-2')
    let cartProductPrice = document.createElement('p');
    cartProductPrice.setAttribute('class', 'card-text my-2')
    
    // Set name and price from shopping cart array loaded from localStorage.
    cartProductName.innerHTML = shoppingCart[i][0];
    //Use the above defined formatter to properly list values.
    cartProductPrice.innerHTML = formatter.format(shoppingCart[i][1]);
    
    // append the values to their appropriate carrier:
    cartProductNameRow.appendChild(cartProductName);
    cartProductPriceRow.appendChild(cartProductPrice);
    cartListRow.appendChild(cartProductNameRow);
    cartListRow.appendChild(cartProductPriceRow);
    cartListParent.appendChild(cartListRow)
  }
  //Add a delete cart button:
  let deleteCartButton = document.createElement('button')
  deleteCartButton.setAttribute('type', 'button')
  deleteCartButton.setAttribute('class', 'btn btn-danger btn-block')
  deleteCartButton.setAttribute('style', 'margin-left: 5px')
  deleteCartButton.innerHTML = "Empty Shopping Cart"
  deleteCartButton.onclick = (evt) => {
    emptyShoppingCart()
  }


  cartCardBody.appendChild(cartCardTitle).innerHTML = cartTitleText;
  cartCardBody.appendChild(cartListParent);
  cartCard.appendChild(cartCardBody)
  cartCard.appendChild(deleteCartButton)
  cartDiv.appendChild(cartCard)
  console.log(shoppingCart)

}

const emptyCartNotification = () => {
  alert("Your cart is empty!")
  let cartDiv = document.getElementById('cart')
  let emptyCart = document.createElement('div');
  emptyCart.setAttribute('id', 'empty-cart-notif');

  let emptyCartCard = document.createElement('div');
  emptyCartCard.setAttribute('class', 'card');
  emptyCart.setAttribute('style', 'width: 24rem')

  let emptyCartCardBody = document.createElement('div');
  emptyCartCardBody.setAttribute('class', 'card-body');

  let emptyCartCardTitle = document.createElement('h2');
  emptyCartCardTitle.setAttribute('class', 'card-title')
  let cardTitleText = "Your cart is empty!"

  emptyCartCardBody.appendChild(emptyCartCardTitle).innerHTML = cardTitleText;
  emptyCartCard.appendChild(emptyCartCardBody)
  emptyCart.appendChild(emptyCartCard);

  return cartDiv.appendChild(emptyCart);
}

function emptyShoppingCart() {
  localStorage.clear();
  return location.reload();
}

function addToCart(event) {
  console.log(event.id)
  console.log(shoppingCart)
  item = productDict[event.id]
  console.log(item);
  shoppingCart.push(item);
  stringifiedList = JSON.stringify(shoppingCart)
  localStorage.setItem('cart', stringifiedList)
}
