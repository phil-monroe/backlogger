<% if flash[:danger].blank? %>
  Flash.success("ok")
<% else %>
  window.location.reload()
<% end %>