import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Cocktail Inspiration", "Add your own concoctions", "Become a cocktail master"],
    typeSpeed: 60,
    loop: true
  });
}

export { loadDynamicBannerText };
