document.addEventListener("turbolinks:load", function(){
  let password_confirmation = document.getElementById('user_password_confirmation')

  if (password_confirmation) {
    addBlockForMessage(password_confirmation)
    password_confirmation.addEventListener("input", compareWithPassword)
   }
})

function compareWithPassword() {
  let password = document.getElementById('user_password')
  let password_status = document.getElementById('password_status')
  if ((password.value.length > 0 && this.value.length > 0) && (this.value == password.value)) {
    password_status.classList.remove('invalid-feedback')
    password_status.classList.add('valid-feedback')
    password_status.innerHTML = "Пароли совпадают"
    password_status.classList.remove('hide')

    this.classList.remove('is-invalid')
    this.classList.add('is-valid')

  } else if ((password.value.length > 0 && this.value.length > 0) && (this.value != password.value)) {
    password_status.classList.remove('valid-feedback')
    password_status.classList.add('invalid-feedback')
    password_status.innerHTML = "Пароли не совпадают"
    password_status.classList.remove('hide')

    this.classList.remove('is-valid')
    this.classList.add('is-invalid')
  } else if (this.value === "") {
    password_status.classList.add('hide')
    this.classList.remove('is-valid')
    this.classList.remove('is-invalid')
  }
}

function addBlockForMessage(el) {
  let info_block = document.createElement('div')
  info_block.id = "password_status"
  info_block.classList.add('hide')

  el.parentNode.appendChild(info_block)
}