<?php $link = new mysqli('localhost', 'root'); // Line updated by A. Datta ?>
<html>
<head>
        <title>Hello world!</title>
        <style>
        body {
                background-color: white;
                text-align: center;
                padding: 50px;
                font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
        }

        #logo {
                margin-bottom: 40px;
                /* Updated: */
                vertical-align: middle;
        }
        h3 {
			color:red;
		}
        </style>
</head>
<body>
        <h3>Based on </h3><img id="logo" src="logo.png" /><!-- Updated -->
        <h1><?php echo "Hello world!"; ?></h1>
        <?php if(!$link) { ?>
                <h2>Can't connect to local MySQL Server!</h2>
        <?php } else { ?>
                <h2>MySQL Server version: <?php echo $link->server_info; // Line updated by A. Datta ?></h2>
        <?php } ?>
</body>
</html>
