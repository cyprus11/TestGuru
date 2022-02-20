document.addEventListener('turbolinks:load', function () {
  let timerField = document.getElementById('timerOutput')

  if (timerField) {
    setInterval(runTimer, 1000)
  }
})

function runTimer() {
  let timerField = document.getElementById('timerOutput')

  if (timerField.textContent === "00:00") {
    window.location.replace(window.location.href + "/result")
    return
  }

  let timeArray = timerField.textContent.split(':')
  let time = new Date(0, 0, 0, 0, timeArray[0], timeArray[1])

  time = new Date(time.getTime() - 1000)

  let minutes = time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes()
  let seconds = time.getSeconds() < 10 ? "0" + time.getSeconds() : time.getSeconds()
  timerField.textContent = minutes + ":" + seconds
}