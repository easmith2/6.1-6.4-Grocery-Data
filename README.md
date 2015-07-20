# Grocery Data Viewer
![](http://media.giphy.com/media/VTXzh4qtahZS/giphy.gif)

## What is it
This is a starter grocery data viewer app to be used as a base from which we will learn about user authentication, pagination & AJAX. The functionality by the end of the week will be as follows:
* customers can authenticate via some method (email/password, e.g.)
* the root page will list out all of their items. If the number of items is > 25, we want to create multiple pages to display only 25 items per page
* at the end of the week, you will be able to load in each set of data (in 25s) via AJAX and place it on to the page

## What is provided
* `Customer` model
* `Item` model
* root route to `items#index`
* `ItemsController` with `index` action
* view for `items#index`

## What is required
By the end of the week, you should have
* user authentication
* the whole app must be on lock down (must be logged in to view the index page)
* scoping the index page to _only_ show items _for the logged in user_
* the index page is paginated on both the server & the client
  * if JavaScript is turned off or doesn't load, then clicking "See more items" should still work
  * if JavaScript is enabled & loaded, then it will asynchronously fetch and then load the fetched items on the page
