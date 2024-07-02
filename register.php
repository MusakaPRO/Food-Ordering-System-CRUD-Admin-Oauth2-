<?php
$showAlert = false; 
$showError = false; 
$exists = false;

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Generate CSRF token if not already set
if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate CSRF token
    if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
        die('Invalid CSRF token');
    }

    // Include file which makes the Database Connection.
    include('config/constants.php');

    $username = $_POST["username"];
    $password = $_POST["password"];
    $cpassword = $_POST["cpassword"];
    $customer_name = $_POST["customer_name"];
    $customer_email = $_POST["customer_email"];
    $customer_contact = $_POST["customer_contact"];
    $customer_address = $_POST["customer_address"];

    $sql = "SELECT * FROM users WHERE username='$username'";

    $result = mysqli_query($conn, $sql);

    $num = mysqli_num_rows($result);

    // Check if the username is already present or not in our Database
    if ($num == 0) {
        if (($password == $cpassword) && $exists == false) {
            $hash = password_hash($password, PASSWORD_DEFAULT);

            // Password Hashing is used here.
            $sql = "INSERT INTO `users` (`username`, `password`, `customer_name`, `customer_email`, `customer_contact`, `customer_address`, `created_at`) VALUES ('$username', '$hash', '$customer_name', '$customer_email', '$customer_contact', '$customer_address', current_timestamp())";

            $result = mysqli_query($conn, $sql);

            if ($result) {
                // Insert into oauth_users table
                $sql_oauth = "INSERT INTO `oauth_users` (`username`, `password`, `first_name`, `last_name`, `email`) VALUES ('$username', '$hash', '', '', '$customer_email')";
                mysqli_query($conn, $sql_oauth);

                $showAlert = true;
            }
        } else {
            $showError = "Passwords do not match";
        }
    } else {
        $exists = "Username not available";
    }
}
?>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <section class="navbar">
        <div class="container">
            <div class="logo">
                <a href="http://localhost/food-order/" title="Logo">
                    <img src="images/logo.png" alt="Restaurant Logo" class="img-responsive">
                </a>
            </div>
            <br>
            <div class="clearfix"></div>
        </div>
    </section>

    <?php
    if ($showAlert) {
        echo ' <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Success!</strong> Your account is now created and you can <a href="login.php">login.</a>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
        </button>
    </div> ';
    }

    if ($showError) {
        echo ' <div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Error!</strong> ' . $showError . '
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">×</span>
    </button>
</div> ';
    }

    if ($exists) {
        echo ' <div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Error!</strong> ' . $exists . '
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">×</span>
</button>
</div> ';
    }
    ?>

    <div class="container my-4 ">
        <h2 class="text-center">Signup Here</h2>
        <h5>*All fields are required</h5>
        <form action="" method="post">
            <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" aria-describedby="emailHelp" required>
            </div>
            <div class="form-group">
                <label for="username">Full Name</label>
                <input type="text" class="form-control" name="customer_name" aria-describedby="emailHelp" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="cpassword">Confirm Password</label>
                <input type="password" class="form-control" id="cpassword" name="cpassword" required>
                <small id="emailHelp" class="form-text text-muted">Make sure to type the same password</small>
            </div>
            <div class="form-group">
                <label for="username">Email</label>
                <input type="email" class="form-control" name="customer_email" aria-describedby="emailHelp" required>
            </div>
            <div class="form-group">
                <label for="username">Phone</label>
                <input type="number" required class="form-control" name="customer_contact" aria-describedby="emailHelp">
                <small id="emailHelp" class="form-text text-muted">Please Enter a valid 10 digit mobile number</small>
            </div>
            <label for="address">Address</label>
            <div class="form-group">
                <textarea name="customer_address" class="form-control" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">SignUp</button>
        </form>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <?php include('partials-front/footer.php'); ?>
</body>
</html>
