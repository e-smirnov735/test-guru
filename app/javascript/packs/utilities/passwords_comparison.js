document.addEventListener("turbolinks:load", function () {
  document
    .querySelectorAll(".reg-form .form-control[type=password]")
    .forEach((el) => el.addEventListener("input", passwordsCompare));
});

function passwordsCompare() {
  const passValue = document.querySelector(
    ".form-control[id=user_password]"
  ).value;
  const confirmValue = document.querySelector(
    ".form-control[id=user_password_confirmation]"
  ).value;
  const icon = document.querySelector(".reg-form .octicon-alert");

  if (confirmValue) {
    if (passValue != confirmValue) {
      icon.classList.remove("octicon-alert__correct", "hide");
      icon.classList.add("octicon-alert__wrong");
    } else {
      icon.classList.remove("octicon-alert__wrong", "hide");
      icon.classList.add("octicon-alert__correct");
    }
  } else {
    icon.classList.remove("octicon-alert__correct", "octicon-alert__wrong");
    icon.classList.add("hide");
  }
}
