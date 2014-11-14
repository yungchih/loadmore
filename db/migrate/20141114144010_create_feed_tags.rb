class CreateFeedTags < ActiveRecord::Migration
  def change
    create_table :feed_tags do |t|
      t.references :feed, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
