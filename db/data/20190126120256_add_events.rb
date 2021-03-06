require "csv"

class AddEvents < SeedMigration::Migration
  def up
    ApplicationRecord.transaction do
      cookpad = Venue.create!(name: "クックパッド株式会社", address: "東京都渋谷区恵比寿4丁目20-3 恵比寿ガーデンプレイスタワー12階", description: "")
      crowdworks = Venue.create!(name: "クラウドワークス株式会社", address: "東京都渋谷区恵比寿4丁目20-3 恵比寿ガーデンプレイスタワー6階", description: "")

      CSV.foreach(Rails.root.join("db/data/20190126_events.csv")) do |row|
        Event.create_with_key!(
          title: row[0],
          pretty_title: row[1],
          venue_id: row[2] == "クックパッド" ? cookpad.id : crowdworks.id,
          starts_at: row[3],
          ends_at: row[4],
          description: row[5],
        )
      end
    end
  end

  def down
    ApplicationRecord.transaction do
      Event.delete_all
      Venue.delete_all
    end
  end
end
