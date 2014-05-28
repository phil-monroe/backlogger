module ApplicationHelper
  def hidden_class tf
    if tf
      'hidden'
    else
      ''
    end
  end

  def hidden_if true_or_false, id = nil
    content_tag :div, id: id, class: hidden_class(true_or_false) do
      yield
    end
  end

  def show_if true_or_false, id = nil
    hidden_if !true_or_false, id do
      yield
    end
  end
end
