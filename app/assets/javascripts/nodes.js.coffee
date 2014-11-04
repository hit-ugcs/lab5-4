# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  counter = 0

  getInputData = (formID, inputID) ->
    $("input##{inputID}[form=#{formID}]").val()

  getFormSerialData = (formID) ->
    utf8: "✓"
    authenticity_token:
      $('meta[name="csrf-token"]').attr('content')
    student: 
      studentid:    parseInt(getInputData(formID, "student_studentid")),
      studentname:  getInputData(formID, "student_studentname"),
      nickname:     getInputData(formID, "student_nickname"),
      projectscore: parseInt(getInputData(formID, "student_projectscore")),
      finalscore:   parseInt(getInputData(formID, "student_finalscore")),
      labscore:     parseInt(getInputData(formID, "student_labscore")),
      classscore:   parseInt(getInputData(formID, "student_classscore"))

  buildRow = (jdata) ->
    $("<tr></tr>")
      .append("<td>#{jdata.studentid}</td>")
      .append("<td>#{jdata.studentname}</td>")
      .append("<td>#{jdata.nickname}</td>")
      .append("<td>#{jdata.projectscore}%</td>")
      .append("<td>#{jdata.finalscore}%</td>")
      .append("<td>#{jdata.labscore}%</td>")
      .append("<td>#{jdata.classscore}%</td>")
      .append("<td>#{jdata.projectscore + jdata.finalscore + jdata.labscore + jdata.classscore}%</td>")
      .append("<td><a class='fa fa-eye' href='/students/#{jdata.id}'></a> <a class='fa fa-pencil-square-o' href='/students/#{jdata.id}/edit'></a> <a class='fa fa-trash' href='/students/#{jdata.id}' data-confirm='Are you sure?' data-method='delete' rel='nofollow'></a></td>")

  # submit link clicked
  $('table').delegate 'a[data-submit]', 'click', ->
    selector = $(this).attr('data-form-id')
    console.log getFormSerialData(selector)
    $.ajax
      type: 'post',
      url: '/students.json',
      data: getFormSerialData(selector),
      success: (data) ->
        console.log(data)
        $('tr#' + selector).replaceWith(buildRow(data))

  # add a new row
  $("#new-item").click ->
    counter += 1
    $("#for-form")
      .append("<form action='/nodes.json' method='post' id=\"form-#{counter}\" ></form>")
    $("<tr id=\"form-#{counter}\"></tr>")
      .append("<td>#{counter}</td>")
      .append("<td><input form=\"form-#{counter}\" id='student_studentname'  name='node[name]'  type='text' /></td>")
      .append("<td><input form=\"form-#{counter}\" id='final' type='number' name='node[weight]' /></td>")
      .append("<td><a class='fa fa-upload' data-submit data-form-id=\"form-#{counter}\"></a></td>")
      .appendTo($("tbody"))
