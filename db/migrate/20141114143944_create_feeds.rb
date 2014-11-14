class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :url
      t.string :guid
      t.datetime :published_at
      t.text :summary
      t.text :content

      t.timestamps
    end
  end
end
