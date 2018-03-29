function selectCity() {
  const cards = document.querySelectorAll('.home-card-banner');
  cards.forEach(card => {
    card.addEventListener('click', (event) => {
      cards.forEach(card => {
        card.classList.remove('category-selected');
      })
      event.target.classList.add('category-selected');
    })
  })
}
export { selectCity }
