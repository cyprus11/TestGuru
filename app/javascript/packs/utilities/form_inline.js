document.addEventListener('turbolinks:load', function() {
  $('.form-inline-link').on('click', formInLineLinkHandler)

  let errors = document.querySelector('.resource-errors')

  if (errors) {
    let resourceId = errors.dataset.resourceId
    formInLineHandler(resourceId)
  }
})

function formInLineLinkHandler(event) {
  event.preventDefault();

  let testId = this.dataset.testId
  formInLineHandler(testId)
}

function formInLineHandler(testId) {
  let link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')

  if (!link) { return }

  let $testTitle = $('.test-title[data-test-id="' + testId + '"]'),
    $formInLine = $('.form-inline[data-test-id="' + testId + '"]')

  $testTitle.toggle()
  $formInLine.toggle()

  if ($formInLine.is(':visible')) {
    link.textContent = 'Отменить'
  } else {
    link.textContent = 'Редактировать'
  }
}