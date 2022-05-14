<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>teamF's restaurant</title>
</head>
<body>
  <div id="page">
 	 <%@ include file = "./header.jsp" %>
       <div class="container">
      <div class="sections">
        <div class="section active" data-bgcolor="#364652">
          <div class="section--image"><img src="./resources/imgs/banner1.jpg" alt="banner1" /></div>
        </div>
        <div class="section" data-bgcolor="#C1A5A9">
          <div class="section--image"><img src="./resources/imgs/banner2.jpg" alt="banner2" /></div>
        </div>
        <div class="section" data-bgcolor="#4ECDC4">
          <div class="section--image"><img src="./resources/imgs/banner3.jpg" alt="banner3" /></div>
        </div>
        <div class="section" data-bgcolor="#D4CBE5">
          <div class="section--image"><img src="./resources/imgs/start1.jpg" alt="banner4" /></div>
        </div>
        <div class="section" data-bgcolor="#EDD4B2">
          <div class="section--image"><img src="./resources/imgs/start2.jpg" alt="banner5" /></div>
        </div>
      </div>
    </div>
    <script>
      // Get all of the images that are marked up to fade in
      const images = document.querySelectorAll('.js-lazyload-image');

      const sections = document.querySelectorAll('.section');

      let config = {
        rootMargin: '0px',
        threshold: 0
      };

      let observer = new IntersectionObserver((entries) => {
        console.log(entries);
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            intersectionHandler(entry);
          }

        });
      }, config);

      sections.forEach(section => {
        observer.observe(section);
      });

      function intersectionHandler(entry) {
        const current = document.querySelector('.section.active');
        const next = entry.target;
        const header = next.querySelector(".section--header");

        if (current) {
          current.classList.remove('active');
        }
        if (next) {
          next.classList.add('active');
          document.body.style.setProperty("--color-bg", next.dataset.bgcolor);
        }
      }

      images.forEach(image => {
        observer.observe(image);
      });

      function preloadImage(img) {
        const src = img.getAttribute('data-src');
        if (!src) {
          return;
        }
        img.src = src;
      }
    </script>
  </div>
</body>

</html>