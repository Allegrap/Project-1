# Project-1
Music store management web app using Ruby, Sinatra and SQL.

The owner of Big Al's Record Store, Big Al, wants an app which will help him keep on top of his store inventory. He does not want an app that customers will see, but he will use to check stock levels and see what he needs to order soon.

You should be able to add stock, which would have an Artist and Album as well as the quantity available.

# MVP
- Create albums with the quantity that are in stock
- Create artists
- Show an inventory page listing albums and artists
- Show a stock level for the inventory items e.g. High/Medium/Low

### Possible Extensions:

- Add a buy and sell price to each stock item
- Calculate the possible markup on items and show on inventory page
- Add a genre to an Album
- Any other ideas you might come up with

## To run from top level:
- psql -d music_shop -f db/music_shop.sql
- ruby db/seeds.rb
- ruby app.rb

Run on http://localhost:4567/
