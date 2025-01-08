document.addEventListener("DOMContentLoaded", function () {
    const tabs = document.querySelectorAll('.nav-link'); // Select all tabs
  
    tabs.forEach(tab => {
      tab.addEventListener('shown.bs.tab', function () {
        // Trigger Swiper update for the active tab
        const activeSwiper = document.querySelector('.tab-pane.active .swiper').swiper;
        if (activeSwiper) {
          activeSwiper.update(); // Update Swiper instance
        }
      });
    });
  });
  