module LinkHelper
  def date(created_at)
    created_at.strftime("%b %d %Y")
  end
end
