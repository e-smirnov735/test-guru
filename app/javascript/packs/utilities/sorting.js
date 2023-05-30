document.addEventListener("turbolinks:load", function () {
  const control = document.querySelector(".sort-by-title");
  if (control) control.addEventListener("click", sortByTitle);
});

function sortByTitle() {
  const tbody = document.querySelector("tbody");
  const rows = tbody.querySelectorAll("tr");
  const arrowUp = this.querySelector(".octicon-arrow-up");
  const arrowDown = this.querySelector(".octicon-arrow-down");

  const sortedRows = Array.from(rows);

  if (arrowUp.classList.contains("hide")) {
    sortedRows.sort(compareRowsAsc);
    arrowUp.classList.remove("hide");
    arrowDown.classList.add("hide");
  } else {
    sortedRows.sort(compareRowsDesc);
    arrowUp.classList.add("hide");
    arrowDown.classList.remove("hide");
  }
  const sortedTbody = document.createElement("tbody");

  sortedRows.forEach((row) => sortedTbody.appendChild(row));
  tbody.parentNode.replaceChild(sortedTbody, tbody);
}

function compareRowsAsc(row1, row2) {
  testTitle1 = row1.querySelector("td").textContent;
  testTitle2 = row2.querySelector("td").textContent;

  if (testTitle1 < testTitle2) return -1;
  if (testTitle1 > testTitle2) return 1;
  return 0;
}

function compareRowsDesc(row1, row2) {
  testTitle1 = row1.querySelector("td").textContent;
  testTitle2 = row2.querySelector("td").textContent;

  if (testTitle1 < testTitle2) return 1;
  if (testTitle1 > testTitle2) return -1;
  return 0;
}
