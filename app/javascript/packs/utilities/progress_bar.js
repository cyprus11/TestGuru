document.addEventListener('turbolinks:load', function() {
  let progressBar = document.querySelectorAll('.progress-step')

  if (progressBar.length) {
    setColorToProgress()
  }
})

function setColorToProgress() {
  let currentPosition = document.querySelector('.current-step')

  for (let i = 1; i < currentPosition.dataset.progressStep; i++) {
    let step = document.querySelector('.progress-step[data-progress-step="' + i + '"]')
    step.classList.add('bg-primary')
  }

  currentPosition.classList.add('bg-success')
}