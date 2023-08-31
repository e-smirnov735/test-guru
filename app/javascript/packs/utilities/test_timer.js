document.addEventListener("turbolinks:load", function () {
  const current_time = document.querySelector(".current-time");
  if (!current_time) {
    clearInterval(timerId);
    return;
  }

  let time = parseInt(current_time.dataset.timeLeft);

  const timerId = setInterval(() => {
    time -= 1;
    current_time.innerText = time;
    if (time == 0) {
      clearInterval(timerId);
      document.getElementById("result-form").submit();
    }
  }, 1000);
});
