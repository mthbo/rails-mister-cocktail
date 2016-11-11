module ApplicationHelper
  def yield_with_default(holder, default)
    if content_for?(holder)
      default + " | " + content_for(holder).squish
    else
      default
    end
  end
end
