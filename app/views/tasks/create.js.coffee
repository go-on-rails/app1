$('#history > table').prepend('<tr class="task_row"><td><%=j render partial: "task_as_table", object: @task, as: :task %></td><tr>')

task_row = $('.task_row').first()
task_row.click ->
    $('.solution', this).slideToggle(50)
do task_row.click
