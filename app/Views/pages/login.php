<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300&display=swap" rel="stylesheet">
		<script src="https://kit.fontawesome.com/3d1bd4626b.js" crossorigin="anonymous"></script>
		<link rel="icon" href="<?=base_url()?>/public/files/logos/2.png" type="image/gif">
		<link rel="stylesheet" href="https://cdn.rawgit.com/jlong/css-spinners/master/css/spinners.css">
		<title>ingrevo | Formulation Software</title> 
		
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

			* {
				box-sizing: border-box;
			}
			.spinner {
				margin: 0 20px !important;
				font-size: 6px !important;
			}
			.hide {
				display: none !important;
			}
			body {
				background: #11111D;
				display: flex;
				flex-direction: column;
				font-family: 'Raleway', sans-serif;
				font-weight: 600;
				height: 100vh;
				margin: 0px;
			}

			h1 {
				font-weight: 800;
				margin: 0;
				font-size: 22px;
			}

			p {
				font-size: 14px;
				font-weight: 100;
				line-height: 20px;
				letter-spacing: 0.5px;
				margin: 20px 0 30px;
			}

			span {
				font-size: 14px;
				margin-top: 10px;
			}

			a {
				color: #000000;
				font-size: 14px;
				text-decoration: none;
				margin: 5px 0;
			}

			button {
				border-radius: 6px;
				border: 0px;
				background-color: #11111D;
				color: #FFFFFF;
				font-size: 12px;
				font-weight: bold;
				padding: 12px 45px;
				letter-spacing: 1px;
				text-transform: uppercase;
				transition: transform 80ms ease-in;
			}

			form {
				background-color: #FFFFFF;
				display: flex;
				align-items: center;
				justify-content: center;
				flex-direction: column;
				padding: 0 50px;
				height: 100%;
				text-align: center;
			}

			input {
				background-color: #ECECEB;
				text-align: center;
				border-radius: 6px;
				border: none;
				padding: 12px 15px;
				margin: 8px 0;
				width: 75%;
			}

			.container {
				background-color: #fff;
				border-radius: 10px;
				box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
				position: relative;
				overflow: hidden;
				width: 75%;
				max-width: 100%;
				min-height: 600px;
				margin: auto;
			}

			.form-container {
				position: absolute;
				top: 0;
				height: 100%;
			}

			.log-in-container {
				width: 50%;
				z-index: 2;
			}


			.overlay-container {
				position: absolute;
				top: 0;
				left: 50%;
				width: 50%;
				height: 100%;
			}

			.overlay {
				background: #FF416C;
				background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
				background: linear-gradient(to right, #FF4B2B, #FF416C);
				background-image: url('<?= base_url() ?>/public/files/media/cosmetics.jpg');
				background-repeat: no-repeat;
				background-size: cover;
				background-position: center center;
				color: #FFFFFF;
				position: relative;
				height: 100%;
				width: 100%;
			}

			.overlay-panel {
				position: absolute;
				display: flex;
				align-items: center;
				justify-content: center;
				flex-direction: column;
				padding: 0 40px;
				text-align: center;
				top: 0;
				height: 100%;
				width: 50%;
			}

			.overlay-right {
				right: 0;
			}

			.mb-10 {
			margin-bottom: 50px !important;
			}

			.mb-25 {
			margin-bottom: 25px !important;
			}

			.mr-10 {
			margin-right: 10px !important;
			}

			input {
			width: 75%;
			}


			@media (max-width: 1200px) {
			.container {
				display: flex;
				flex-direction: column;
				align-items: center;
				overflow: hidden;
				justify-content: center;
				width: 400px;
				max-width: 90%;
				min-height: 550px;
			}

			.form-container {
				position: absolute;
				flex-direction: column;
				align-items: center;
				background-color: #ffffff;
				width: 100%;
			}

			form {
				background-color: #FFFFFF;
				display: flex;
				align-items: center;
				justify-content: center;
				flex-direction: column;
				padding: 0px;
				height: 100%;
				text-align: center;
			}

			.overlay-container {
				position: static;
				width: 50%;
			}

			img {
				width: 50%;
			}

			.mb-10 {
			margin-bottom: 50px !important;
			}
		}
	</style>
	</head>

	<body>
		<div class="container" id="container">
			<div class="form-container log-in-container">
				<form id="login_p" action="<?= base_url() ?>/login/auth" method="post">
					<img src="<?= base_url() ?>/public/files/logos/1.svg" width="50%" class="img-fluid text-center mb-10" alt="Logo">
					<h1>Login</h1>
					</br>
					
					<input type="text" name="user_email" placeholder="Email"/>
					<input class="mb-25" type="password" name="user_password" placeholder="Password"/>
					<?php if(session()->getFlashdata('msg')):?>
						<div class="alert text-muted flash_msg mb-25" style="color: green !important;"><?= session()->getFlashdata('msg') ?></div> 
					<?php endif;?>
					<div class="flash_msg" id="flash_msg" style="color: green !important;"></div> 
					
					<div class="d-flex">
						<button type="submit">
							Login
						</button>
						<span class="hide throbber-loader spinner "></span>
					</div>
					<br>
					<a href="<?= base_url() ?>/request_password">Forgot your password?</a>
					<a href="https://ingrevo.com/checkout/?group=8/" class="mb-10">Don't have an account? Sign Up</a>
					<div class="row"> 
						<a href="https://www.ingrevo.com"><i class="fa-solid fa-globe fa-xl mr-10"></i></a>
						<a href="https://facebook.com/ingrevo"><i class="fa-brands fa-square-facebook fa-xl mr-10"></i></a>
						<a href="https://instagram.com/ingrevouk"><i class="fa-brands fa-instagram fa-xl"></i></a>
					</div>

				</form>
			</div>
			<div class="overlay-container">
				<div class="overlay">
					<div class="overlay-panel overlay-right">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$("button[type='submit']").click(function(e) {
		e.preventDefault();
		$('.flash_msg')
			.removeClass('mb-25')
			.html('');
		if($("[name='user_email']").val() == '') {
			$('#flash_msg')
				.removeClass('hide')
				.addClass('alert text-muted mb-25')
				.html('Email is required');
			return;
		}
		$('#flash_msg')
			.html('')
			.addClass('hide')
			.removeClass('alert text-muted mb-25');
		$(this)
			.attr('disabled', true)
			.css('background-color','#8787a9');
		$('.spinner').removeClass('hide').addClass('throbber-loader');
		$('#login_p').submit();
	});

</script>