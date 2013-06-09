module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert-success"
    when :error then "alert-error"
    when :alert then "alert-warning"
    end
  end
end
