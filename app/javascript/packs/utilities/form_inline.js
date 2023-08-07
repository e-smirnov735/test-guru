import { I18n } from "i18n-js";
import translations from "../../locales.json";

const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const locale = urlParams.get("lang");

const i18n = new I18n(translations);
i18n.locale = locale || "ru";

document.addEventListener("turbolinks:load", function () {
  document
    .querySelectorAll(".form-inline-link")
    .forEach((el) => el.addEventListener("click", formInlineLinkHandler));
  const errors = document.querySelector(".resource-errors");
  if (errors) {
    const resourceId = errors.dataset.resourceId;
    formInlineHandler(resourceId);
  }
});
function formInlineLinkHandler(e) {
  e.preventDefault();
  const testId = this.dataset.testId;
  formInlineHandler(testId);
}
function formInlineHandler(testId) {
  const attr = `data-test-id="${testId}"`;
  const link = document.querySelector(`.form-inline-link[${attr}]`);
  const testTitle = document.querySelector(`.test-title[${attr}]`);
  const formInline = document.querySelector(`.form-inline[${attr}]`);

  if (!formInline) return;

  if (formInline.classList.contains("hide")) {
    testTitle.classList.add("hide");
    formInline.classList.remove("hide");
    link.value = i18n.t("admin.tests.test.cancel");
  } else {
    testTitle.classList.remove("hide");
    formInline.classList.add("hide");
    link.value = i18n.t("edit");
  }
}
