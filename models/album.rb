require_relative('../db/sql_runner')

class Album

  attr_reader :id, :title, :artist_id, :genre, :image_url, :quantity, :sell_price, :buy_price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @artist_id = options['artist_id'].to_i
    @genre = options['genre']
    @image_url = options['image_url']
    @quantity = options['quantity'].to_i
    @sell_price = options['sell_price'].to_i
    @buy_price = options['buy_price'].to_i
  end

  def save()
    sql = "INSERT INTO albums (
    title,
    artist_id,
    genre,
    image_url,
    quantity,
    sell_price,
    buy_price
    ) VALUES (
    '#{@title}',
    #{@artist_id},
    '#{@genre}',
    '#{@image_url}',
    #{@quantity},
    #{@sell_price},
    #{@buy_price}
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET
    title = '#{@title}',
    artist_id = #{@artist_id},
    genre = '#{@genre}',
    image_url = '#{@image_url}',
    quantity = #{quantity},
    sell_price = #{@sell_price},
    buy_price = #{@buy_price} 
    WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def show_stock_level()
    if @quantity <= 20
      return "LOW"
    elsif @quantity <= 30
      return "MEDIUM"
    else
      return "HIGH"
    end
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    result = SqlRunner.run(sql)
    return Artist.new(result.first())
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id}"
    album = SqlRunner.run(sql)
    result = Album.new(album.first)
    return result
  end

  def self.num_of_diff_albums()
    return Album.all.length
  end

  def self.total_stock()
    sql = "SELECT albums.quantity FROM albums"
    results = SqlRunner.run(sql)

    total_albums = 0
    results.each {|hash_item| total_albums += hash_item['quantity'].to_i}
    
    return total_albums.to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map {|album| Album.new(album)}
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

end