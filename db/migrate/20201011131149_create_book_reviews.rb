class CreateBookReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :book_reviews do |t|
      t.string :title
      t.string :body
      t.timestamp
    end
  end
end
