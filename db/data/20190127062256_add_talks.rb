require "csv"

class AddTalks < SeedMigration::Migration
  def up
    ApplicationRecord.transaction do
      CSV.foreach(Rails.root.join("db/data/201901271538_talks.csv")) do |row|
        event = Event.find_by!(title: row[0])

        Talk.create!(
          title: row[1],
          speaker_name: row[2],
          speaker_email: "no-address@example.com",
          speaker_sns_id: row[3],
          speaker_sns_url: row[4],
          speaker_belongs: row[5],
          speaker_role: row[6],
          event_id: event.id
        )
      end
    end
  end

  def down
    Talk.delete_all
  end
end
