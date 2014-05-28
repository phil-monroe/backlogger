<% if @exception.blank? %>
  <% if @sharing.user.present? %>
    $('#shared-users-list').append("<li><%= @sharing.user.name %></li>")
    alert('Added')
  <% end %>
<% else %>
  alert("<%= @exception.message %>")
<% end %>