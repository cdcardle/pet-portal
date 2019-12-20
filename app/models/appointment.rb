class Appointment < ApplicationRecord
  def time
    datetime.strftime("%l:%M%P").strip
  end

  def date
    datetime.strftime("%Y-%m-%d")
  end
end
