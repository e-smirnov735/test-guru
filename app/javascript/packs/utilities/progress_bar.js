document.addEventListener("turbolinks:load", function () {
  progressBar = document.querySelector(".test-progress-bar");
  if (progressBar) {
    const { max, current } = progressBar.dataset;
    console.log(max, current);

    percent = Math.floor((current / max) * 100);

    progressBar.setAttribute("value", percent);
  }
});
