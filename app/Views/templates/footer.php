<style>
  footer {
    bottom: 0;
    left: 0;
    position: fixed;
    right: 0;
    z-index: 1032;
  }

  footer> :last-child {
    margin-bottom: 0px !important;
  }

  .expad {
    padding-bottom: 70px;
  }

  .section {
    margin: 0;
    padding-bottom: 5px;
  }

  .no {
    width: 95vw;
    margin: 0 auto;
  }

  body {
    font-size: 0.75rem !important;
  }

  .cusNav {
    width: 95vw;
    margin: 0 auto;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    padding: 0;
  }

  .cusNav>a {
    margin-left: 0 !important;
  }

  @media only screen and (min-width: 767px) {
    body {
      overflow-x: hidden;
    }
  }

  .btn-klean {
    background-color: #f1f0ec !important;
    outline: none !important;
    color: #000000 !important;
    border: 0px solid black;
    border-radius: 6px;
    font-size: 0.75rem !important;
  }

  .btn-klean-active {
    background-color: #161C2D !important;
    outline: none !important;
    color: white !important;
    border: 0px solid #000000;
    border-radius: 6px;
    font-size: 0.75rem !important;
  }

  .btn-klean-danger {
    background-color: #DC3545 !important;
    outline: none !important;
    color: white !important;
    border: 0px solid #000000;
    border-radius: 5px;
    font-size: 0.75rem !important;

  }

  .btn-danger {
    border-radius: 6px;
    color: #ffffff !important;
    font-size: 0.75rem !important;
  }

  .btn-success {
    border-radius: 6px;
    background-color: #161C2D !important;
    border: none;
    color: #fff !important;
    font-size: 0.75rem !important;
  }

  .btn-secondary {
    border-radius: 6px;
    background-color: #f1f0ec !important;
    border: none;
    color: #000 !important;
    font-size: 0.75rem !important;
  }

  .btn-warning {
    border-radius: 6px;
    background-color: #FFC107 !important;
    border: none;
    color: #000 !important;
    font-size: 0.75rem !important;
  }

  .btn-primary:hover {
    background-color: #5A5A5A;
    font-size: 0.75rem !important;
  }

  .btn-danger:hover {
    background-color: #DC3545;
    font-size: 0.75rem !important;
  }

  .btn-primary {
    border-radius: 6px;
    background-color: #5A5A5A;
    border: none;
    color: #fff;
    font-size: 0.75rem !important;
  }

  form .form-control {
    border-radius: 6px;
    outline: none !important;
    box-shadow: none !important;
    font-size: 0.75rem !important;
  }

  form .form-select {
    border-radius: 6px;
    outline: none !important;
    box-shadow: none !important;
    font-size: 0.75rem !important;
  }

  .btn:focus,
  .btn:active {
    outline: none !important;
    box-shadow: none;
    font-size: 0.75rem !important;
  }

  div {
    font-family: 'Inter', sans-serif;
  }

  #help-icon {
    color: #161C2D;
  }
</style>
</section>
<div>
  <footer style="background-color: #161C2D;" class="mt-5">
    <div class="row">
      <div class="text-center text-white pt-2 pb-2">&copy; <?php echo date("Y"); ?> Copyright. All Rights Reserved.
        Ingrevo</div>
    </div>
  </footer>
</div>


<script>
  function schedulePo() {
    let brandLogo = document.querySelector('a.navbar-brand');
    let lgo = brandLogo.offsetWidth;
    brandLogo.style.marginLeft = 0;
    let windowHeight = window.innerHeight;
    // let sectionClass = document.querySelector('.section');
    // sectionClass.style.minHeight = windowHeight+"px";
    let footerTag = document.querySelector('footer');
    let sectionPostion = sectionClass.getBoundingClientRect();
    let sectionHeight = sectionClass.offsetHeight;
    let footerHeight = footerTag.offsetHeight;
    sectionClass.style.minHeight = (sectionHeight - footerHeight - 10) - sectionPostion.y + 'px';
  }
  // Default when loading
  schedulePo();

  // change when window resize or change
  window.addEventListener('resize', schedulePo);
</script>
</body>

</html>