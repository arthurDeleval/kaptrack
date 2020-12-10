import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const bannerTypedText = document.getElementById('banner-typed-text')
    if (bannerTypedText){
      new Typed('#banner-typed-text', {
        strings: ["Take a look at our menu !"],
        typeSpeed: 50,
        loop: true
      });
    }
}

export { loadDynamicBannerText };
