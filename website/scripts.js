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

const formatter = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'USD',
});

var shoppingCart = []

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

const loadShoppingCart = () => {
  // load shopping cart from localStorage
  shoppingCart = JSON.parse(localStorage.getItem('cart'));
  // if no items in shopping cart, display empty cart notification:
  if(shoppingCart === null) {
    return emptyCartNotification()
  }
  // if items in shopping cart check if empty cart notification is up:
  if (document.body.contains(document.getElementById('empty-cart-notif'))) {
    document.getElementById('empty-cart-notif').remove();
  }
  let cartDiv = document.getElementById('cart')

  let cartCard = document.createElement('div');
  cartCard.setAttribute('id', 'shopping-cart-card')
  cartCard.setAttribute('style', 'width: 24rem')
  cartCard.setAttribute('class', 'card col-md-2')

  let cartCardBody = document.createElement('div');
  cartCardBody.setAttribute('class', 'card-body');


  let cartCardTitle = document.createElement('h5');
  cartCardTitle.setAttribute('class', 'card-title');
  let cartTitleText = "Your shopping cart contains: <hr>";

  let cartListParent = document.createElement('div');
  
  for (let i = 0; i < shoppingCart.length; i++) {
    console.log(shoppingCart[i])
    let cartProductName = document.createElement('p');
    cartProductName.setAttribute('class', 'card-text my-2')
    
    let cartProductPrice = document.createElement('p');
    cartProductPrice.setAttribute('class', 'card-text my-2')

    // Set name and price from shopping cart array loaded from localStorage.
    cartProductName.innerHTML = shoppingCart[i][0];
    //Use the above defined formatter to properly list values.
    cartProductPrice.innerHTML = formatter.format(shoppingCart[i][1]);

    cartListParent.appendChild(cartProductName)
    cartListParent.appendChild(cartProductPrice);
  }
  cartCardBody.appendChild(cartCardTitle).innerHTML = cartTitleText;
  cartCardBody.appendChild(cartListParent);
  cartCard.appendChild(cartCardBody)
  cartDiv.appendChild(cartCard)
  console.log(shoppingCart)

  //  let listParent = document.createElement('div')
  // listParent.setAttribute('id', `card-${id}`)
}

const emptyShoppingCart = () => {
  localStorage.clear();
  return location.reload();
}

const addToCart = (event) => {
  console.log(event.id)
  item = productDict[event.id]
  console.log(item);
  shoppingCart.push(item);
  stringifiedList = JSON.stringify(shoppingCart)
  localStorage.setItem('cart', stringifiedList)
} 