// app/javascript/flight_plan_search.js

document.addEventListener("turbo:load", () => {
  const input = document.getElementById("flight-plan-search")
  if (!input) return

  const items = document.querySelectorAll("[data-searchable-item]")

  input.addEventListener("input", () => {
    const query = input.value.toLowerCase().trim()

    items.forEach((item) => {
      const name = item.dataset.name || ""
      const url = item.dataset.url || ""
      const match = name.includes(query) || url.includes(query)

      item.style.display = match ? "" : "none"
    })
  })
})