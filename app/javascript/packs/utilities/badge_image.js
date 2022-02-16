document.addEventListener('turbolinks:load', function() {
  let imageInput = document.getElementById('imageLink'),
      imageCanvas = document.getElementById('imagePreShow')

  if (imageInput && imageCanvas) {
    imageInput.addEventListener("change", changeImage)
  }
})

function changeImage() {
  let imageInput = document.getElementById('imageLink'),
      imageCanvas = document.getElementById('imagePreShow')

      if (imageInput.value.startsWith('http')) {
        if (doesFileExist(imageInput.value)) {
          imageCanvas.src = imageInput.value
        } else {
          imageCanvas.src = "/assets/default_badge.png"
        }
      } else {
        imageCanvas.src = "/assets/" + imageInput.value
      }
}

function doesFileExist(urlToFile) {
  var xhr = new XMLHttpRequest();
  xhr.open('HEAD', urlToFile, false);
  xhr.send();

  if (xhr.status == "404") {
      return false;
  } else {
      return true;
  }
}