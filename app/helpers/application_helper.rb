module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when 'notice'
      'alert-success'   # Success alert for notices
    when 'alert'
      'alert-danger'    # Error alert for alerts
    else
      'alert-warning'   # Warning alert for other flash types
    end
  end
end
