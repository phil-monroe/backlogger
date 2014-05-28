jQuery ->
  # make the table sortable
  $('.sorted-table').sortable
    containerSelector: 'table',
    itemPath: '> tbody',
    itemSelector: 'tr',
    placeholder: '<tr class="placeholder"/>',
    onDrop: (item, container, _super) ->
      $(item).removeClass('dragged')
      $(item).removeAttr('style')
      ids = []
      $('.sorted-table tbody tr').each ->
        id = $(this).data('story-id')
        ids.push(id)
      $('#backlog_form #backlog_story_order').val(ids)
      $('#backlog_form').submit()

  # Add tootip to total complexity label
  $('.total-complexity').tooltip()
