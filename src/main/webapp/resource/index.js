const accordionHeaders = document.querySelectorAll('.nav-item-header');
accordionHeaders.forEach(header => {
  header.addEventListener("click", () => {
    const navSubMenu = header.parentElement;
    const navContens = navSubMenu.querySelector('.nav-item-content');
    const isOpen = navSubMenu.classList.contains('active');
    if (isOpen) {
      navSubMenu.classList.remove('active');
      navContens.style.display = 'none';
    } else {
      navSubMenu.classList.add('active');
      navContens.style.display = 'block';
    }
  });
});

const slidingContainer = document.querySelector('.slider-container');
const sliderImages = document.querySelectorAll('.slider-container img');
let currentIndex = 0;
const intervalTime = 3500;
function slide() {
  currentIndex++;
  if (currentIndex >= sliderImages.length) {
    currentIndex = 0;
  }
  slidingContainer.style.transform = `translateX(-${currentIndex * 100}%)`;
  setTimeout(slide, intervalTime);
}
slide();



