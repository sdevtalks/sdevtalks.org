class Venue < ApplicationRecord
  def address_with_line_break
    address.split(/ /).join("\n")
  end
end
