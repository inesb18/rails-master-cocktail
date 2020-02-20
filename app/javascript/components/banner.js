import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["traditional", "creative", "bold"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
