function replaceCheckbox() {
  const activities = document.querySelectorAll('.activity-card');
  activities.forEach(activity => {
    activity.addEventListener('click', (event) => {
      activity.classList.toggle('category-selected');
  })
})
}

export { replaceCheckbox }
