#= require jquery
#= require jquery-sortable
#= require jquery_ujs
#= require simplex
#= require_self

jQuery ->
  $('.sorted-table').sortable(
    containerSelector: 'table',
    itemPath: '> tbody',
    itemSelector: 'tbody tr',
    placeholder: '<tr class="placeholder"/>',
    onDrop: (item, container, _super) ->
      ids = []
      $('.sorted-table tbody tr').each ->
        id = $(this).data('story-id')
        ids.push(id)
      $('#backlog_form #backlog_story_order').val(ids)
      $('#backlog_form').submit()
  )

  $('.total-complexity').tooltip()
